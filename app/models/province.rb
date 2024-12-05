class Province < ApplicationRecord
  has_many :customers

  validates :name, allow_blank: true

  enum name: { alberta: 0,
               british_columbia: 1,
               manitoba: 2,
               new_brunswick: 3,
               nove_scotia: 4,
               ontario: 5,
               prince_edward_island: 6,
               quebec: 7,
               saskatchewan: 8,
               yukon: 9,
               newfoundland_and_labrador: 10,
               northwest_territories: 11,
               nunavut: 12 }
end
