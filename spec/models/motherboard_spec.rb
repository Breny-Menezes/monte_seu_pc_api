require 'rails_helper'

RSpec.describe Motherboard, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:supported_processing_unit) }
    it { is_expected.to validate_presence_of(:available_ram_slots) }
    it { is_expected.to validate_presence_of(:max_ram_supported) }
    it { is_expected.to validate_numericality_of(:available_ram_slots).only_integer }
    it { is_expected.to validate_numericality_of(:max_ram_supported).only_integer }

    it 'should only accept value between 1 to 4 on available_ram_slots' do
      [1, 2, 3, 4].each do |v|
        should allow_value(v).for(:available_ram_slots)
      end

      should_not allow_value(5).for(:available_ram_slots)
      should_not allow_value(0).for(:available_ram_slots)
    end

    it 'should only accept value: 8, 16, 32, 64 on max_ram_supported' do
      [8, 16, 32, 64].each do |v|
        should allow_value(v).for(:max_ram_supported)
      end

      should_not allow_value(4).for(:max_ram_supported)
      should_not allow_value(13).for(:max_ram_supported)
      should_not allow_value(16.5).for(:max_ram_supported)
    end

    it 'should validate presence and value boolean on integrated_video_card' do
      [true, false].each do |v|
        should allow_value(v).for(:integrated_video_card)
      end

      should_not allow_value(nil).for(:integrated_video_card)
    end
  end
end
