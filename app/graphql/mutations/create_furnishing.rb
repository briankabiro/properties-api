class Mutations::CreateFurnishing < Mutations::BaseMutation
  argument :beds, Integer, required: false
  argument :chairs, Integer, required: false
  argument :tables, Integer, required: false
  argument :propertyId, Integer, required: true

  field :furnishing, Types::FurnishingType, null: false
  field :errors, [String], null: false 

  def resolve(beds:, chairs:, tables:, propertyId:)
    property = Property.find(propertyId)

    furnishing = Furnishing.new(
      beds: beds, chairs: chairs, tables: tables, property_id: property.id
    )
    
    if furnishing.save
      {
        furnishing: furnishing,
        errors: []
      }
    else
      {
        furnishing: nil,
        errors: furnishing.errors.full_messages
      }
    end
  end
end