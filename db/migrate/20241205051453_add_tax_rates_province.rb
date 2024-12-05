class AddTaxRatesProvince < ActiveRecord::Migration[7.2]
  def change
    add_column :provinces, :pst_tax, :decimal
    add_column :provinces, :gst_tax, :decimal
    add_column :provinces, :hst_tax, :decimal
  end
end
