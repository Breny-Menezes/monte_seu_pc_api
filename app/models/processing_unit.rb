class ProcessingUnit < ApplicationRecord

  enum brand: {
    intel: 1,
    amd: 2
  }

  validates_presence_of :description, :brand
end
