class FarmerProductsController < ApplicationController

  def new
    @farmer_product = FarmerProduct.new
  end

  def create
    @farmer_product = FarmerProduct.new(farmer_product_params)
    @farmer_product.user = current_user
    if @farmer_product.save
      #change redirect to index
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def farmer_product_params
    params.require(:farmer_product).permit(:product_id)
  end
end


