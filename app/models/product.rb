class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
