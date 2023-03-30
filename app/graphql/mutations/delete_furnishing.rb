class Mutations::DeleteFurnishing < Mutations::BaseMutation
  argument :id, Integer, required: true

  type Types::FurnishingType

  def resolve(id:)
    furnishing = Furnishing.find_by(id: id)
    return {} if !furnishing

    furnishing.destroy
  end
end