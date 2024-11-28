class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [ :username ]
  has_many :orders
  has_many :comments
  has_one :cart

  validates :first_name, :last_name, :address, :phone_number, :user_role, presence: true
  enum user_role: { admin: 1, registered_user: 2, visitor: 3 }, _default: 2

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "orders", "cart" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "first_name", "id", "id_value",
      "last_name", "password", "phone_number", "updated_at", "user_role",
      "username", "reset_password_token_cont", "reset_password_token_eq",
      "reset_password_token_start", "reset_password_token_end" ]
  end
end
