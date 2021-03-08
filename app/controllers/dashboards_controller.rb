class DashboardsController < ApplicationController
  def show
    @buyers = User.where(role: "buyer")
    @buyer_preferences = @buyers.map do |buyer|
      buyer.buyer_preferences
    end.flatten

    @farmer_products = current_user.farmer_products
    # @buyer_preferences = @buyer_preferences.select do |pref|

    # @farmer_products.include?(pref.product)
    # end

    @product_array = []
    @farmer_products.each do |farmerproduct|
      @product_array << farmerproduct.product.id
    end
    if current_user.role == "farmer"
    render "dashboards/show"
    else
    render "dashboards/show_buyer"
    end
  end
end
