require 'rails_helper'

RSpec.describe RamMemory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:size)}
    it { is_expected.to validate_numericality_of(:size).only_integer }

    it 'should only accept value: 4, 8, 16, 32, 64 on max_ram_supported' do
      [4, 8, 16, 32, 64].each do |v|
        should allow_value(v).for(:size)
      end

      should_not allow_value(6).for(:size)
      should_not allow_value(13).for(:size)
      should_not allow_value(16.5).for(:size)
    end
  end
end
