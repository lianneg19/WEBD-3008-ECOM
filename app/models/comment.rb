class Comment < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :product, optional: true

  validates :content, :rating, presence: true
end
