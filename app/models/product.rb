class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :descriptio, :price, presence: true
  validates :price, :decimal, precision: 5, scale: 2, numericality: { greater_than: 0 }
end
