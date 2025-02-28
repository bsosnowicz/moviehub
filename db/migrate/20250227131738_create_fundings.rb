class CreateFundings < ActiveRecord::Migration[8.0]
  def change
    create_table :fundings do |t|
      t.string :title
      t.text :description
      t.decimal :goal_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
