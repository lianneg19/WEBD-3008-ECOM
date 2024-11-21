class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 2 }

  def self.ransackable_associations(auth_object = nil)
    [ "category", "order_products", "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "description", "id", "id_value", "name", "price", "updated_at" ]
  end

  def self.search(search, category_id = nil)
    if search.present?
      Product.where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    else
      Product.all
    end
  end
end
