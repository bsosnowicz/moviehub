class CreateActors < ActiveRecord::Migration[8.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :place_of_birth
      t.integer :height
      t.decimal :rating

      t.timestamps
    end
  end
end
