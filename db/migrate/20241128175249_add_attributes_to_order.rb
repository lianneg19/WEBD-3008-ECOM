class AddAttributesToOrder < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :total, :decimal
    add_column :orders, :tax, :decimal
  end
end
