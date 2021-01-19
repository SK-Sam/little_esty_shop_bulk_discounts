require 'rails_helper'

RSpec.describe 'Show Page for Merchant Discounts' do
  describe 'Individual page for each Merchant Discount' do
    it 'can display a specific discount quantity threshold and percentage discount' do
      merchant1 = Merchant.create!(name: "Test1")
      discount1 = merchant1.discounts.create!(threshold: 20, percent: 10)
      visit merchant_discount_path(merchant1, discount1)
      
      expect(page).to have_content("Items must reach #{discount1.threshold} threshold to receive discount")
      expect(page).to have_content("Items will receive #{discount1.percent}% off if threshold is reached")
    end
  end
end