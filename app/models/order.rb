class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true
  enum status: { active: 1, completed: 2, canceled: 3 }, _default: 1

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "customer_id", "id", "status", "updated_at",
      "subtotal", "total", "tax" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "customer", "order_products", "products" ]
  end

  # sources used by: https://www.youtube.com/@HappyCoding
  # def subtotal
  #   order_products.sum do  |order_product|
  #     order_products.products.price * order_product.quantity
  #   end
  # end

  # private
  # def set_subtotal
  #   self[:subtotal] = subtotal
  # end
end
