class Product < ApplicationRecord
  belongs_to :market
  has_many :buyer_preferences, dependent: :destroy
  has_many :farmer_products, dependent: :destroy
  has_many :users, through: :buyer_preferences
  has_many :users, through: :farmer_products

  def average_price
    if self.buyer_preferences.any?
      @average_price = 0
      self.buyer_preferences.each do |pref|
        @average_price += pref.price
      end
      @average_price = @average_price / self.buyer_preferences.count
    else
      @average_price = 0
    end
      @average_price
  end

  def count_buyer
    self.buyer_preferences.count
  end
end
