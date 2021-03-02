class TransactionProduct < ApplicationRecord
  belongs_to :transaction
  belongs_to :buyer_preference

  validates :quantity, presence: true
end
