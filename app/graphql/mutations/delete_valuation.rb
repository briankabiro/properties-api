class Mutations::DeleteValuation< Mutations::BaseMutation
  argument :id, Integer, required: true

  type Types::ValuationType

  def resolve(id:)
    valuation = Valuation.find_by(id: id)
    return {} if !valuation

    valuation.destroy
  end
end