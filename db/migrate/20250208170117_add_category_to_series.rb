class AddCategoryToSeries < ActiveRecord::Migration[8.0]
  def change
    add_column :series, :category, :string
  end
end
