class Motherboard < ApplicationRecord

  enum supported_processing_unit: {
    intel: 1,
    amd: 2,
    both: 3
  }

  validates_presence_of :description, :supported_processing_unit, :available_ram_slots, :max_ram_supported
  validates_numericality_of :available_ram_slots, :max_ram_supported, only_integer: true
  validates_inclusion_of :available_ram_slots, :in => 1..4, message: "can only have one to four slots available."
  validates_inclusion_of :max_ram_supported, :in => [8, 16, 32, 64], message: "can only be a max value of 8, 16, 32 or 64 GB."
  validates_inclusion_of :integrated_video_card, :in => [true, false], message: "Field can only be true or false."

end
