class AddImageUrlToActors < ActiveRecord::Migration[8.0]
  def change
    add_column :actors, :image_url, :string
  end
end
