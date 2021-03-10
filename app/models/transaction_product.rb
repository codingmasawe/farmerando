class TransactionProduct < ApplicationRecord
  belongs_to :farmer_transaction
  belongs_to :buyer_preference

  validates :quantity, presence: true
end
