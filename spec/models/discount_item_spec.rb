require 'rails_helper'

RSpec.describe DiscountItem, type: :model do
  describe 'Relationships' do
    it { should belong_to :discount }
    it { should belong_to :item }
  end
end
