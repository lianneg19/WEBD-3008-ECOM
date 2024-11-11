class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password
      t.string :address
      t.string :phone_number
      t.integer :user_role

      t.timestamps
    end
  end
end
