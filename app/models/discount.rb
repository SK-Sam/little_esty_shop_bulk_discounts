class Discount < ApplicationRecord
  validates_presence_of :threshold
  validates_presence_of :percent
  
  has_many :discount_items, dependent: :destroy
  has_many :items, through: :discount_items

  belongs_to :merchant
end
