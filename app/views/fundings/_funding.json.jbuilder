json.extract! funding, :id, :title, :description, :goal_amount, :user_id, :created_at, :updated_at
json.url funding_url(funding, format: :json)
