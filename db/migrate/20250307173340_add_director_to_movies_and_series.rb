class AddDirectorToMoviesAndSeries < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :director, :string
    add_column :series, :director, :string
  end
end
