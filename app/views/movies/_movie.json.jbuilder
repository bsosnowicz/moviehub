json.extract! movie, :id, :title, :description, :rating, :release_date, :length, :created_at, :updated_at
json.url movie_url(movie, format: :json)
