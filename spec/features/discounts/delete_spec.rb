require 'rails_helper'

RSpec.describe 'Delete Functionality' do
  describe 'Able to delete from DB and Index' do
    it 'can click on delete button and see that object does not exist' do
      merchant1 = Merchant.create(name: "Hello World")
      discount1 = merchant1.discounts.create(threshold: 20, percent: 10)

      visit merchant_discounts_path(merchant1)

      expect(page).to have_content(discount1.threshold)
      expect(page).to have_content(discount1.percent)

      click_on "Delete Discount"

      expect(current_path).to eq(merchant_discounts_path(merchant1))

      expect(page).not_to have_content(discount1.threshold)
      expect(page).not_to have_content(discount1.percent)
    end
  end
end