class Cart < ApplicationRecord
  belongs_to :customer

  def self.ransackable_associations(auth_object = nil)
    [ "customer" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "customer_id", "id", "updated_at" ]
  end
end
