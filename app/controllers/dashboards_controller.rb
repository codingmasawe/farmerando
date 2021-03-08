class DashboardsController < ApplicationController
  def show
    # if current_user.role? :farmer
    #   #display farmer dashboard
    # else
    @buyers = User.where(role: "buyer")
    # raise
    # end
    @buyer_preferences = @buyers.map do |buyer|
      buyer.buyer_preferences
    end.flatten

    @farmer_products = current_user.products
    @buyer_preferences = @buyer_preferences.select do |pref|
      @farmer_products.include?(pref.product)
    end



  end

end
