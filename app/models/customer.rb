class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :username, :password, :address, :phone_number, :user_role, presence: true
  enum user_role: { admin: 1, registered_user: 2, visitor: 3 }
end
