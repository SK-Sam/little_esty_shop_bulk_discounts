require 'rails_helper'

RSpec.describe 'Show Page for Merchant Discounts' do
  describe 'Individual page for each Merchant Discount' do
    it 'can display a specific discount quantity threshold and percentage discount' do
      merchant1 = Merchant.create!(name: "Test1")
      discount1 = merchant1.discounts.create!(threshold: 20, percent: 10)
      visit merchant_discount_path(merchant1, discount1)
      save_and_open_page
    end
  end
end