require 'rails_helper'

RSpec.describe Valuation, type: :model do
  describe 'associations' do
    it { should belong_to(:property) }
  end
end