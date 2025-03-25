class ChatResponsesController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.httpdate
    sse = SSE.new(response.stream, event: "message")
    

    movie_titles = Movie.pluck(:title).join(', ')
    actor_names = Actor.pluck(:name, :surname).map { |name, surname| "#{name} #{surname}" }.join(', ')
    series_titles = Series.pluck(:title).join(', ')
    initial_prompt = <<~PROMPT
      You are an AI assistant with access to a database with only titles of movies,  TV series, actors names and surnames. Here is some information you can use to answer questions:

      Movie Titles: #{movie_titles}.
      Actor Names: #{actor_names}.
      TV Series Titles: #{series_titles}.

      Your task is to respond based only on the names available in the database and ignore anything not included in the database but you can get more info about movies series and actors that are included in database.
      Remember all my prompts that i've typed before in this session
    PROMPT

    user_input = params[:prompt]

    session[:chat_history] ||= [{ role: "system", content: initial_prompt }]
    session[:chat_history] << { role: "user", content: user_input }

    messages = session[:chat_history]

    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])
    
    Rails.logger.debug "Aktualna historia sesji: #{messages}"


    begin
      client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: messages,
          stream: proc do |chunk|
            content = chunk.dig("choices", 0, "delta", "content")
            if content
              session[:chat_history] << { role: "assistant", content: content } 
              sse.write({ message: content })
            end
          end
        }
      )
    ensure
      sse.close
    end
  end
end
