require 'rails_helper'

RSpec.describe 'Merchant Discount New Page' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount1 = @merchant1.discounts.create(percent: 10, quantity: 20)
  end
  describe 'Create New Discounts' do
    it 'can create a new discount and have it visible on the Merchant Discount Index page' do
      visit merchant_discounts_path(@merchant1)

      expect(page).not_to have_content(@discount1.percent)
      click_button "Create New Discount"

      fill_in 'percent_off', with: 100
      fill_in 'quantity_threshold', with: 20
      click_on "Create New Discount"

      expect(current_path).to eq(merchant_discounts_path(@merchant1))
      expect(page).to have_content(@discount1.percent)
      expect(page).to have_content(@discount1.quantity)
    end
  end
end