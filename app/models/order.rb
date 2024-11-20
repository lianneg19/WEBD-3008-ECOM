class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true
  enum status: { active: 1, shipped: 2, canceled: 3 }
end
