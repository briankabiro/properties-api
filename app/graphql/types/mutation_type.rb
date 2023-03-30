module Types
  class MutationType < Types::BaseObject
    field :create_property, mutation: Mutations::CreateProperty
    field :delete_property, mutation: Mutations::DeleteProperty
    
    field :create_furnishing, mutation: Mutations::CreateFurnishing
    field :delete_furnishing, mutation: Mutations::DeleteFurnishing

    field :create_valuation, mutation: Mutations::CreateValuation
    field :delete_valuation, mutation: Mutations::DeleteValuation
  end
end
