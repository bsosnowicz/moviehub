class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.decimal :rating
      t.date :release_date
      t.decimal :length

      t.timestamps
    end
  end
end
