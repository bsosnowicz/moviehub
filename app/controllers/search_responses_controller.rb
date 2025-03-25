class SearchResponsesController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.httpdate
    sse = SSE.new(response.stream, event: "message")

    movies = Movie.pluck(:id, :title).map { |id, title| { title: title, id: id } }
    series = Series.pluck(:id, :title).map { |id, title| { title: title, id: id } }
    actors = Actor.pluck(:id, :name, :surname).map { |id, name, surname| { name: "#{name} #{surname}", id: id } }


    initial_prompt = <<~PROMPT
      You are an AI assistant with access to a structured movie database.

      Movies: #{movies}
      TV Series: #{series}
      Actors: #{actors}

      IMPORTANT: Respond **ONLY** using the IDs from the provided data.
      - If asked about a movie, respond **EXACTLY** like this: /movies/{MOVIE_ID}
      - If asked about a series, respond **EXACTLY** like this: /series/{SERIES_ID}
      - If asked about an actor, respond **EXACTLY** like this: /actors/{ACTOR_ID}

      Example Responses:
      - User asks about "Inception" ➝ /movies/150
      - User asks about "Breaking Bad" ➝ /series/35
      - User asks about "Leonardo DiCaprio" ➝ /actors/99

      DO NOT respond with the title, only with the ID format.
      DO NOT generate answers unrelated to movies, series, or actors.

      If you can't mmatch any movie/series/actor, respond **EXACTLY** with: "not found"

    PROMPT

    user_input = params[:query]
    messages = [
      { role: "system", content: initial_prompt },
      { role: "user", content: user_input }
    ]

    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])

    begin
      client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: messages,
          temperature: 0,
          stream: proc do |chunk|
            content = chunk.dig("choices", 0, "delta", "content")
            if content
              sse.write({ message: content })
            end
          end
        }
      )
    ensure
      sse.close
    end
  Rails.logger.debug("Sending request to OpenAI with prompt: #{params[:prompt]}")
  end
end
