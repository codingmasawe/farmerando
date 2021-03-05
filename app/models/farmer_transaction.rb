class FarmerTransaction < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :farmer, class_name: "User"
  has_many :transaction_products
end


