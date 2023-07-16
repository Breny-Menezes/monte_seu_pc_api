require 'rails_helper'

RSpec.describe ProcessingUnit, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:brand) }
  end
end
