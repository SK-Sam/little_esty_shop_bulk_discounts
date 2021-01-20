class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :discount_items, dependent: :destroy
  has_many :discounts, through: :discount_items
  belongs_to :merchant

  enum status: [:disabled, :enabled]

  def best_day
    invoices
    .joins(:invoice_items)
    .where('invoices.status = 2')
    .select('invoices.created_at AS created_at, sum(invoice_items.unit_price * invoice_items.quantity) as money')
    .group(:id)
    .order("money desc", "created_at desc")
    .first
    .created_at
    .to_date
  end
end
