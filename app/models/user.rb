class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :farmer_products, dependent: :destroy
  # has_many :products, through: :farmer_products

  has_many :buyer_preferences, dependent: :destroy
  has_many :products, through: :buyer_preferences

  # has_many :user_markets, dependent: :destroy
  # has_many :markets, through: :user_markets

  has_many :transactions_as_buyer, class_name: "FarmerTransaction", foreign_key: :buyer_id
  has_many :transactions_as_farmer, class_name: "FarmerTransaction", foreign_key: :farmer_id

  def all_farmer_products
    self.farmer_products.map { |fp| fp.product }
  end
end
