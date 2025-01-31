class CreateSeries < ActiveRecord::Migration[8.0]
  def change
    create_table :series do |t|
      t.string :title
      t.text :description
      t.decimal :rating
      t.date :release_date
      t.integer :no_of_seasons

      t.timestamps
    end
  end
end
