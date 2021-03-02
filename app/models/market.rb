class Market < ApplicationRecord
  has_many :user_markets, dependent: :destroy
  has_many :users, through: :user_markets
end
