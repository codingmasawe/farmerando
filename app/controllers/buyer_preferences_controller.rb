class BuyerPreferencesController < ApplicationController
  def new
    @buyer_preference = BuyerPreference.new
  end

  def create
    @buyer_preference = BuyerPreference.new(buyer_preference_params)
    @buyer_preference.user = current_user
    @buyer_preference.product = Product.find(params[:buyer_preference][:product_id])
    if @buyer_preference.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer_preference_params
    params.require(:buyer_preference).permit(:price, :user, :product)
  end
end
