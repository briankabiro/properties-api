class Valuation < ApplicationRecord
  belongs_to :property

  enum :price_currency, { eur: "eur", usd: "usd", gbp: "gbp" }

  validates_uniqueness_of :property_id
end
