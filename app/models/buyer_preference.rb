class BuyerPreference < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :transaction_products

  validates :price, presence: true
end
