class FarmerProductsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @farmer_product = FarmerProduct.new
  end

  def create
    @products = Product.all
    @farmer_product = FarmerProduct.new(params[:farmer_product][:product_id])
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
