require 'rails_helper'

RSpec.describe 'Edit Discount Page' do
  describe 'Edit functionality' do
    before :each do
      @merchant = Merchant.create!(name: "Merchant Shop")
      @discount = @merchant.discounts.create!(threshold: 200, percent: 100)
    end
    it 'can fill in edit form and see the changes when redirected' do
      visit merchant_discount_path(@merchant, @discount)
      
      expect(page).to have_content("Items must reach #{@discount.threshold} threshold to receive discount")
      expect(page).to have_content("Items will receive #{@discount.percent}% off if threshold is reached")

      click_on "Edit Discount"

      expect(find_field('discount[threshold]').value).to eq(@discount.threshold.to_s)
      expect(find_field('discount[percent]').value).to eq(@discount.percent.to_s)

      percent = 2.0
      threshold = 1
      fill_in 'discount_threshold', with: threshold
      fill_in 'discount[percent]', with: percent
      click_on "Update Discount"

      expect(current_path).to eq(merchant_discount_path(@merchant, @discount))
      expect(page).to have_content("Items must reach #{threshold} threshold to receive discount")
      expect(page).to have_content("Items will receive #{percent}% off if threshold is reached")
    end
    it 'can show sad paths when invalid information' do
      visit merchant_discount_path(@merchant, @discount)
      click_on "Edit Discount"
      fill_in 'discount_threshold', with: ""
      fill_in 'discount[percent]', with: ""
      click_on "Update Discount"
      
      within('section.errors') do
        expect(page).to have_content("Threshold can't be blank")
        expect(page).to have_content("Percent can't be blank")
      end
    end
  end
end