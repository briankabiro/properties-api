class Mutations::CreateProperty < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: true
  argument :city, String, required: true

  field :property, Types::PropertyType, null: false
  field :errors, [String], null: false 

  def resolve(name:, description:, city:)
    property = Property.new(name: name, description: description, city: city)
    if property.save
      {
        property: property,
        errors: []
      }
    else
      {
        property: nil,
        errors: property.errors.full_messages
      }
    end
  end
end