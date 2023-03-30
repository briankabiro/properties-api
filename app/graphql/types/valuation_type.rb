# frozen_string_literal: true

module Types
  class ValuationType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :price_cents, Integer, null: false
    field :price_currency, String, null: false 
    field :has_offer, Boolean, null: false
    field :property_id, Integer, null: false
    field :property, PropertyType, null: false
  end
end
