require 'rails_helper'

RSpec.describe AssemblyPcRequest, type: :model do

  describe 'associations' do
    it { is_expected.to have_one(:personal_computer) }
    it { is_expected.to accept_nested_attributes_for(:personal_computer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:customer_document) }
  end
end
