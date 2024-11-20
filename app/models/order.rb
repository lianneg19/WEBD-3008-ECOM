class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true
  enum status: { active: 1, shipped: 2, canceled: 3 }

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "customer_id", "id", "status", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "customer", "order_products", "products" ]
  end
end
