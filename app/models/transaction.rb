class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :farmer, class_name: "User"
end


