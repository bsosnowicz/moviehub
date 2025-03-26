class SearchResponsesController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.httpdate
    sse = SSE.new(response.stream, event: "message")

    user_input = params[:query]
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])

    system_prompt = <<~PROMPT
      You are an assistant that classifies natural language queries for a media database.
      Your job is to return JSON with the entity type (movie, series, actor) and possible filters.
      Example:
      Query: "Actors born in New York"
      Output: { "type": "actor", "filters": { "birthplace": "New York" } }

      Return only valid JSON and nothing else.
    PROMPT

    classification = client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_input }
        ],
        temperature: 0
      }
    )

    parsed = JSON.parse(classification.dig("choices", 0, "message", "content")) rescue nil

    unless parsed && parsed["type"]
      sse.write({ message: "Could not understand the query." }.to_json)
      return
    end

    type = parsed["type"]
    filters = parsed["filters"] || {}

    records = case type
              when "actor" then Actor.all
              when "movie" then Movie.all
              when "series" then Series.all
              else []
              end

    if records.empty?
      sse.write({ message: "No records found for this type." }.to_json)
      return
    end


    items = records.map do |record|
      case type
      when "actor"
        "#{record.name} #{record.surname}"
      when "movie", "series"
        record.title
      end
    end

    batch_prompt = <<~PROMPT
      Given the following list of #{type}s:

      #{items.to_json}

      And the user query: "#{user_input}"

      Return a JSON array with only the #{type}s that match the user's request.
      Return only names/titles that match the query.
      Format: ["Item 1", "Item 2", ...]
    PROMPT

    selection_response = client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You filter a list of media entries based on user queries. Respond only with a JSON array." },
          { role: "user", content: batch_prompt }
        ],
        temperature: 0
      }
    )

    matched_names = JSON.parse(selection_response.dig("choices", 0, "message", "content")) rescue []

    if matched_names.empty?
      sse.write({ message: "No results found." }.to_json)
      return
    end

    matching_records = records.select do |record|
      name = type == "actor" ? "#{record.name} #{record.surname}" : record.title
      matched_names.include?(name)
    end

    matching_records.each do |record|
      display = case type
                when "actor" then "#{record.name} #{record.surname}"
                when "movie", "series" then record.title
                end
      sse.write({ message: "🔹 #{display}" }.to_json)
      sleep 0.2
    end

  rescue => e
    sse.write({ message: "An error occurred while processing your request." }.to_json)
  ensure
    sse.close
  end
end
