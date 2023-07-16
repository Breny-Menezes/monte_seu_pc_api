require 'rails_helper'

RSpec.describe PersonalComputer, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:assembly_pc_request) }
    it { is_expected.to belong_to(:motherboard) }
    it { is_expected.to belong_to(:processing_unit) }
    it { is_expected.to belong_to(:video_card) }
    it { is_expected.to have_many(:personal_computer_ram_memories) }
    it { is_expected.to accept_nested_attributes_for(:personal_computer_ram_memories) }
  end

  describe 'validations' do
    load File.expand_path('seeds.rb', Rails.root.to_s + '/db')

    it 'should validate presence of video card if motherboard does not have integrated_video_card' do
      motherboard = Motherboard.find_by_description("Asus ROG")
      personal_computer = PersonalComputer.new(motherboard_id: motherboard.id, processing_unit_id: 1)
      personal_computer.save

      expect(personal_computer.errors[:video_card_id]).to include("The PC has to have a video card. Please select one.")
    end

    it 'should not validate presence of video card if motherboard have integrated_video_card' do
      motherboard = Motherboard.find_by_description("ASRock Steel Legend")
      personal_computer = PersonalComputer.new(motherboard_id: motherboard.id, processing_unit_id: 1)
      personal_computer.save

      expect(personal_computer.errors[:video_card_id]).to_not include("The PC has to have a video card. Please select one.")
    end

    context 'should validate if the @personal_computer has ram memories associated or not' do
      before :each do
        motherboard = Motherboard.find_by_description("ASRock Steel Legend")
        @personal_computer = PersonalComputer.new(motherboard_id: motherboard.id)
      end

      it 'does not have any RAM memory associated' do
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to include("The PC has to have a RAM memory associated with it.")
      end

      it 'has one or more RAM memories associated' do
        @personal_computer.personal_computer_ram_memories.build(ram_memory_id: 1)
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to_not include("The PC has to have a RAM memory associated with it.")
      end
    end

    context 'should validate if the @personal_computer has slots available to all ram_memories' do
      before :each do
        @motherboard = Motherboard.find_by_description("Asus ROG")
        @ram_memory = RamMemory.find_by_size(4)
        @personal_computer = PersonalComputer.new(motherboard_id: @motherboard.id, processing_unit_id: 1 )

        2.times do
          @personal_computer.personal_computer_ram_memories.build(ram_memory_id: @ram_memory.id)
        end
      end

      it 'has slots available to all ram memories' do
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to_not include("The PC has only #{@motherboard.available_ram_slots} RAM slots available.")
      end

      it 'does not have slots enough to all ram memories' do
        @personal_computer.personal_computer_ram_memories.build(ram_memory_id: @ram_memory.id)
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to include("The PC has only #{@motherboard.available_ram_slots} RAM slots available.")
      end
    end

    context 'should validate if the @personal_computer max_ram_supported support all ram memories' do
      before :each do
        @motherboard = Motherboard.find_by_description("Asus ROG")
        @ram_memory = RamMemory.find_by_size(16)
        @personal_computer = PersonalComputer.new(motherboard_id: @motherboard.id, processing_unit_id: 1 )

        @personal_computer.personal_computer_ram_memories.build(ram_memory_id: @ram_memory.id)
      end

      it 'has the amount supported' do
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to_not include("The PC doesn't support more than #{@motherboard.max_ram_supported}GB.")
      end

      it 'has the amout above the supported' do
        @personal_computer.personal_computer_ram_memories.build(ram_memory_id: @ram_memory.id)
        @personal_computer.save

        expect(@personal_computer.errors[:base]).to include("The PC doesn't support more than #{@motherboard.max_ram_supported}GB.")
      end
    end

    context 'should validate if the processing unit is compatible with the motherboard' do
      it 'has the same compatibility' do
        motherboard = Motherboard.find_by_description('Asus ROG')
        processing_unit = ProcessingUnit.find_by_description('Core i7')
        personal_computer = PersonalComputer.new(motherboard_id: motherboard.id, processing_unit_id: processing_unit.id)
        personal_computer.save

        expect(personal_computer.errors[:base]).to_not include("The Motherboard is incompatible with the selected processing unit.")
      end

      it 'has different compatibility' do
        motherboard = Motherboard.find_by_description('Asus ROG')
        processing_unit = ProcessingUnit.find_by_description('Ryzen 7')
        personal_computer = PersonalComputer.new(motherboard_id: motherboard.id, processing_unit_id: processing_unit.id)
        personal_computer.save

        expect(personal_computer.errors[:base]).to include("The Motherboard is incompatible with the selected processing unit.")
      end

      it 'motherboard accepts both' do
        motherboard = Motherboard.find_by_description('ASRock Steel Legend')
        processing_unit = ProcessingUnit.find_by_description('Ryzen 7')
        personal_computer = PersonalComputer.new(motherboard_id: motherboard.id, processing_unit_id: processing_unit.id)
        personal_computer.save

        expect(personal_computer.errors[:base]).to_not include("The Motherboard is incompatible with the selected processing unit.")
      end
    end

  end
end
