class TransactionProduct < ApplicationRecord
  belongs_to :farmer_transaction
  belongs_to :buyer_preference
  has_one :product

  validates :quantity, presence: true
end
