class Product < ApplicationRecord
  belongs_to :market
  has_many :buyer_preferences, dependent: :destroy
  has_many :farmer_products, dependent: :destroy
  has_many :users, through: :buyer_preferences
  has_many :users, through: :farmer_products
end
