class PersonalComputerRamMemory < ApplicationRecord

  belongs_to :personal_computer, required: true
  belongs_to :ram_memory, required: true

end
