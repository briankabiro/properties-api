require 'rails_helper'

module Properties
  RSpec.describe Property, type: :request do
    let!(:property) { Property.create(name: "Home", description: "Home", city: "London") }
    let!(:property_2) { Property.create(name: "Crib", description: "Crib", city: "Berlin") }

    describe '.resolve' do
      it 'fetches all properties' do
        post '/graphql', params: { query: fetch_all_properties_query }
        json = JSON.parse(response.body)

        data = json['data']['properties']
        expect(data.size).to eq Property.all.size
        expect(data.first['name']).to eq property.name
        expect(data.second['name']).to eq property_2.name
      end

      it 'fetches a property' do
        post '/graphql', params: { query: fetch_a_property_query(id: property.id) }
        json = JSON.parse(response.body)
        data = json['data']['property']
        expect(data['name']).to eq property.name
      end
    end

    def fetch_all_properties_query
      <<~GQL 
        query {
          properties {
            name,
            description,
            city
          }
        }
      GQL
    end

    def fetch_a_property_query(id:)
      <<~GQL 
        query {
          property(id: #{id}) {
            id,
            name,
            description,
            city
          }
        }
      GQL
    end
  end
end
