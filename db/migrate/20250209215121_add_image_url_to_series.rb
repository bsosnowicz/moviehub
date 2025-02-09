class AddImageUrlToSeries < ActiveRecord::Migration[8.0]
  def change
    add_column :series, :image_url, :string
  end
end
