require 'rails_helper'

RSpec.describe 'Show Page for Merchant Discounts' do
  describe 'Individual page for each Merchant Discount' do
    before :each do
      @merchant1 = Merchant.create!(name: "Test1")
      @discount1 = @merchant1.discounts.create!(threshold: 20, percent: 10)
      visit merchant_discount_path(@merchant1, @discount1)
    end
    it 'can display a specific discount quantity threshold and percentage discount' do
      within('section.discount-stats') do
        expect(page).to have_content("Items must reach #{@discount1.threshold} threshold to receive discount")
        expect(page).to have_content("Items will receive #{@discount1.percent}% off if threshold is reached")
      end
    end
    it 'has a link that leads to an edit page' do
      expect(page).to have_link "Edit Discount"

      click_on "Edit Discount"

      expect(current_path).to eq(edit_merchant_discount_path(@merchant1, @discount1))
    end
  end
end