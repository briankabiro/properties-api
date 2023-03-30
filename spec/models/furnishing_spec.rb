require 'rails_helper'

RSpec.describe Furnishing, type: :model do
  describe 'associations' do
    it { should belong_to(:property) }
  end
end