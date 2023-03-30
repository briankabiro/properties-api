class Mutations::CreateValuation < Mutations::BaseMutation
  argument :price_cents, Integer, required: true
  argument :price_currency, String, required: true
  argument :propertyId, Integer, required: true
  argument :has_offer, Boolean, required: true

  field :valuation, Types::ValuationType, null: false
  field :errors, [String], null: false 

  def resolve(has_offer:, price_cents:, price_currency:, propertyId:)
    property = Property.find_by(id: propertyId)

    valuation = Valuation.new(
      has_offer: has_offer, price_cents: price_cents, price_currency: price_currency, property_id: property.id
    )
    
    if valuation.save
      {
        valuation: valuation,
        errors: []
      }
    else
      {
        valuation: nil,
        errors: valuation.errors.full_messages
      }
    end
  end
end