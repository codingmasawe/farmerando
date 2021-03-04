class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :farmer_products, dependent: :destroy
  # has_many :products, through: :farmer_products

  # has_many :buyer_preferences, dependent: :destroy
  # has_many :products, through: :buyer_preferences

  # has_many :user_markets, dependent: :destroy
  # has_many :markets, through: :user_markets

  has_many :transactions_as_buyer, source: :farmer_transactions, foreign_key: :buyer_id
  has_many :transactions_as_farmer, source: :farmer_transactions, foreign_key: :farmer_id
end
