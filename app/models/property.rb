class Property < ApplicationRecord
  has_one :valuation, dependent: :destroy
  has_one :furnishing, dependent: :destroy

  validates_presence_of :name, :description, :city
end
