class Comment < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :product, optional: true

  validates :content, :rating, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "content", "created_at", "customer_id", "id", "product_id", "rating", "updated_at" ]
  end
end
