class AddAttributesToOrderProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :order_products, :quantity, :integer
  end
end
