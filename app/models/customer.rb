class Customer < ApplicationRecord
  has_many :orders
  validates :name, presence: true
  validates_uniqueness_of :name
end
