class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unit_price
  before_save :set_total_price

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "order_id", "product_id", "updated_at", "quantity" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order", "product" ]
  end

  # sources used by: https://www.youtube.com/@HappyCoding
  def unit_price
    if persisted?
      seld[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private
    def set_unit_price
      self[:unit_price] = unit_price
    end

    def set_total_price
      self[:tota_price] = quantity & set_unit_price
    end
end
