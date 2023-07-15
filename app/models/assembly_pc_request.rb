class AssemblyPcRequest < ApplicationRecord

  has_one :personal_computer, required: true

  accepts_nested_attributes_for :personal_computer

  validates_presence_of :customer_name, :customer_document

end
