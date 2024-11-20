class Customer < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :first_name, :last_name, :address, :phone_number, :user_role, presence: true
  enum user_role: { admin: 1, registered_user: 2, visitor: 3 }

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "first_name", "id", "id_value", "last_name", "password", "phone_number", "updated_at", "user_role", "username" ]
  end
end
