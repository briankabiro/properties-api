# frozen_string_literal: true

module Types
  class PropertyType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :city, String, null: false
    field :furnishing, FurnishingType, null: true
    field :valuation, ValuationType, null: true
  end
end
