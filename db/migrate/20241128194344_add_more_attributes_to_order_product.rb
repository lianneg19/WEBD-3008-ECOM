class AddMoreAttributesToOrderProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :order_products, :unit_price, :decimal
    add_column :order_products, :total_price, :decimal
  end
end
