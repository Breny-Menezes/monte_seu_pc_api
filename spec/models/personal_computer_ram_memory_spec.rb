require 'rails_helper'

RSpec.describe PersonalComputerRamMemory, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:personal_computer) }
    it { is_expected.to belong_to(:ram_memory) }
  end
end
