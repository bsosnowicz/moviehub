class AddStripeProductIdToFundings < ActiveRecord::Migration[8.0]
  def change
    add_column :fundings, :stripe_product_id, :string
    add_column :fundings, :image_url, :string
  end
end
