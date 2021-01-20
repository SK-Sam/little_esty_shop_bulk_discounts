require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { should validate_presence_of :invoice_id }
    it { should validate_presence_of :item_id }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
  end
  describe "relationships" do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end
  describe "class methods" do
    it '::incomplete_invoices' do
      merchant = Merchant.create!(name: "Test")
      customer = Customer.create!(first_name: "Test", last_name: "test")
      invoice = Invoice.create(status: 1, merchant: merchant, customer: customer)
      invoice2 = Invoice.create(status: 1, merchant: merchant, customer: customer)
      item = merchant.items.create!(name: "Taco", description: "Yum", unit_price: 1)

      ii1 = InvoiceItem.create!(invoice: invoice, item: item, status: 0, quantity: 1, unit_price: 1)
      ii2 = InvoiceItem.create!(invoice: invoice, item: item, status: 0, quantity: 1, unit_price: 1)
      ii3 = InvoiceItem.create!(invoice: invoice2, item: item, status: 2, quantity: 1, unit_price: 1)

      expect(InvoiceItem.incomplete_invoices).to eq([invoice])
    end
  end
end
