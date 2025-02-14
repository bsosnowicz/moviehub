class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: true, foreign_key: true
      t.references :series, null: true, foreign_key: true
      t.references :actor, null: true, foreign_key: true

      t.timestamps
    end
  end
end
