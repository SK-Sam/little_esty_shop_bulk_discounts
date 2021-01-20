require 'rails_helper'

RSpec.describe 'Merchant Discount New Page' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount1 = @merchant1.discounts.create(percent: 10, threshold: 20)
  end
  describe 'Create New Discounts' do
    it 'can create a new discount and have it visible on the Merchant Discount Index page' do
      visit merchant_discounts_path(@merchant1)
      percent = 100
      threshold = 25

      expect(page).not_to have_content(percent)
      expect(page).not_to have_content(threshold)
      click_on "Create New Discount"

      fill_in 'discount_threshold', with: percent
      fill_in 'discount[percent]', with: threshold
      click_on "Create New Discount"

      expect(current_path).to eq(merchant_discounts_path(@merchant1))
      expect(page).to have_content(percent)
      expect(page).to have_content(threshold)
    end
    it 'can show sad paths when invalid information' do
      visit merchant_discounts_path(@merchant1)
      click_on "Create New Discount"
      click_on "Create New Discount"
      
      within('section.errors') do
        expect(page).to have_content("Threshold can't be blank")
        expect(page).to have_content("Percent can't be blank")
      end
    end
  end
end