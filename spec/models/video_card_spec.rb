require 'rails_helper'

RSpec.describe VideoCard, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
