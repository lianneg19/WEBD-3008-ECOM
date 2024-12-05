class ChangeProvinceColumnNameType < ActiveRecord::Migration[7.2]
  def change
    change_column :provinces, :name, :integer
  end
end
