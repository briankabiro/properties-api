require 'rails_helper'

module Mutations
  RSpec.describe Property, type: :request do
    describe '.resolve' do
      let(:name) { 'Redwood Apartments' }
      let(:description) { '5 bedroom house' }
      let(:city) { 'Nairobi' }

      it 'creates a property' do
        post '/graphql', params: { query: create_property_query(name, description, city) }
        json = JSON.parse(response.body)
        data = json['data']['createProperty']['property']
        
        expect(data['name']).to eq(name)
        expect(data['description']).to eq(description)
        expect(data['city']).to eq(city)
      end
    end
  
    def create_property_query(name, description, city)
      <<~GQL 
        mutation {
          createProperty(input: {
            name: "#{name}"
            description: "#{description}"
            city: "#{city}"
          }) {
            property {
              name
              description
              city
            }
            errors
          }
        }
      GQL
    end 
  end
end