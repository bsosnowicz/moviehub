json.extract! series, :id, :title, :description, :rating, :release_date, :no_of_seasons, :created_at, :updated_at
json.url series_url(series, format: :json)
