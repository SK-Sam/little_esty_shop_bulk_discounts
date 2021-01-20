require 'rails_helper'

RSpec.describe 'Merchant Discount Index Page' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount1 = @merchant1.discounts.create!(percent: 20.0, threshold: 15)
    @discount2 = @merchant1.discounts.create!(percent: 30.0, threshold: 20)
    @discount3 = @merchant1.discounts.create!(percent: 40.0, threshold: 10)
    visit "/merchant/#{@merchant1.id}/discounts"
  end
  describe 'Append all Discounts' do
    it 'can show all discounts owned by a Merchant along with showing rate off and thresholds' do
      within('section.discounts') do
        expect(page).to have_content(@discount1.percent)
        expect(page).to have_content(@discount1.threshold)
      end
    end
    it 'can have a button that links to new discount page' do
      expect(page).to have_link "Create New Discount"
      
      click_on "Create New Discount"

      expect(current_path).to eq(new_merchant_discount_path(@merchant1))
    end
  end
end