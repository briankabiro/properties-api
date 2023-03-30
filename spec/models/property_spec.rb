require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'associations' do
    it { should have_one(:valuation) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:city) }
  end
end