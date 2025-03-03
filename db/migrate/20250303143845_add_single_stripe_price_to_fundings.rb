class AddSingleStripePriceToFundings < ActiveRecord::Migration[8.0]
  def change
    add_column :fundings, :stripe_single_price, :string
  end
end
