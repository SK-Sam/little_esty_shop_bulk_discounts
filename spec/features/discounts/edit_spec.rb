require 'rails_helper'

RSpec.describe 'Edit Discount Page' do
  describe 'Edit functionality' do
    before :each do
      @merchant = Merchant.create!(name: "Merchant Shop")
      @discount = @merchant.discounts.create!(threshold: 100, percent: 100)
    end
    it 'can fill in edit form and see the changes when redirected' do
      visit merchant_discount_path(@merchant, @discount)
      
      expect(page).to have_content("Items must reach #{@discount.threshold} threshold to receive discount")
      expect(page).to have_content("Items will receive #{@discount.percent}% off if threshold is reached")

      click_on "Edit Discount"

      expect(page).to have_content(@discount.threshold)
      expect(page).to have_content(@discount.percent)

      percent = 1.0
      threshold = 1
      fill_in 'discount_threshold', with: percent
      fill_in 'discount[percent]', with: threshold
      click_on "Update Discount"

      expect(current_path).to eq(merchant_discount_path(@merchant, @discount))
      expect(page).to have_content("Items must reach #{threshold} threshold to receive discount")
      expect(page).to have_content("Items will receive #{percent}% off if threshold is reached")
    end
  end
end