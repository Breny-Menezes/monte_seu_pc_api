class PersonalComputer < ApplicationRecord

  belongs_to :assembly_pc_request, required: true
  belongs_to :motherboard, required: true
  belongs_to :processing_unit, required: true
  belongs_to :video_card, required: false

  has_many :personal_computer_ram_memories, dependent: :destroy
  has_many :ram_memories, through: :personal_computer_ram_memories

  accepts_nested_attributes_for :personal_computer_ram_memories

  validates_presence_of :video_card_id, unless: Proc.new { self.motherboard.integrated_video_card?}, message: 'The PC has to have a video card. Please select one.'

  validate :has_ram_memories_associated?
  validate :motherboard_is_compatible_with_processing_unit?
  validate :ram_memories_quantity_fits_slots_motherboard?
  validate :ram_memories_size_fits_max_ram_motherboard?

  def has_ram_memories_associated?
    errors.add(:base, "The PC has to have a RAM memory associated with it.") if personal_computer_ram_memories.reject { |ram| ram.marked_for_destruction? }.empty?
  end

  def motherboard_is_compatible_with_processing_unit?
    if motherboard.supported_processing_unit != 'both'
      errors.add(:base, "The Motherboard is incompatible with the selected processing unit.") if processing_unit.brand != motherboard.supported_processing_unit
    end
  end

  def ram_memories_quantity_fits_slots_motherboard?
    errors.add(:base, "The PC has only #{motherboard.available_ram_slots} RAM slots available.") if personal_computer_ram_memories.size > motherboard.available_ram_slots
  end

  def ram_memories_size_fits_max_ram_motherboard?
    errors.add(:base, "The PC doesn't support more than #{motherboard.max_ram_supported}GB.") if personal_computer_ram_memories.map(&:ram_memory).sum(&:size) > motherboard.max_ram_supported
  end
end
