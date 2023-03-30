class Furnishing < ApplicationRecord
  belongs_to :property
  validates_uniqueness_of :property_id
end
