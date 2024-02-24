class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items
  validates :customer_id, presence: true
  validates :order_date, presence: true
end
