class RamMemory < ApplicationRecord

  validates_presence_of :description, :size
  validates_numericality_of :size, only_integer: true
  validates_inclusion_of :size, :in => [4, 8, 16, 32, 64], message: "can only have the size of 4, 8, 16, 32 or 64 GB of memory."

end
