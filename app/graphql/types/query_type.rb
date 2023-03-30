module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    
    # fetch all properties
    field :properties, [Types::PropertyType], null: false
    def properties
      Property.all
    end

    # fetch property with furnishing and valuation
    field :property, Types::PropertyType, null: false do
      argument :id, ID, required: true
    end

    def property(id:)
      Property.includes(:furnishing, :valuation).find_by(id: id)
    end

    # get all valuations
    field :valuations, [Types::ValuationType], null: false
    def valuations
      Valuation.all
    end

    # get a valuation with the property
    field :valuation, Types::ValuationType, null: false do
      argument :id, ID, required: true
    end

    def valuation(id:)
      valuation = Valuation.includes(:property).find_by(id: id)
      return {} if !valuation

      valuation
    end

    # get all furnishings
    field :furnishings, [Types::FurnishingType], null: false
    def furnishings
      Furnishing.all
    end

    # get a furnishing with the property
    field :furnishing, Types::FurnishingType, null: false do
      argument :id, ID, required: true
    end

    def furnishing(id:)
      furnishing = Furnishing.includes(:property).find_by(id: id)
      return {} if !furnishing

      furnishing
    end
  end
end
