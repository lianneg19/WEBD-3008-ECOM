class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "order_id", "product_id", "updated_at", "quantity" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order", "product" ]
  end
end
