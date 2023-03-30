class Mutations::DeleteProperty < Mutations::BaseMutation
  argument :id, Integer, required: true

  type Types::PropertyType

  def resolve(id:)
    property = Property.find_by(id: id)
    return {} if !property

    property.destroy
  end
end