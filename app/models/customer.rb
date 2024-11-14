class Customer < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :first_name, :last_name, :address, :phone_number, :user_role, presence: true
  enum user_role: { admin: 1, registered_user: 2, visitor: 3 }
end
