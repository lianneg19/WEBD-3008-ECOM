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

  # SEARCH keyword and category
  def self.search(search, category_id)
    all_products = Product.all

    if search.present? && category_id.present?
      all_products.where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
                .where(category_id: category_id)
    elsif search.present?
      all_products.where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    elsif category_id.present?
      all_products.where(category_id: category_id)
    else
      all_products
    end
  end
end
