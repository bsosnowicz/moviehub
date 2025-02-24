class AddTrailerLinkToMovies < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :trailer_url, :string
    add_column :series, :trailer_url, :string
    add_column :actors, :trailer_url, :string
  end
end
