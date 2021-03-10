class FarmerProductsController < ApplicationController

  def new
    @farmer_product = FarmerProduct.new
  end

  def create
    @farmer_product = FarmerProduct.new(farmer_product_params)
    @farmer_product.user = current_user
    if @farmer_product.save
      #change redirect to index
      redirect_to my_products_path
    else
      render :new
    end
  end

  def edit
    @farmer_product = FarmerProduct.find(params[:id])
  end

  def update
  end

  def my_products
    @farmer_products = current_user.farmer_products
  end

  def destroy
    @farmer_product = FarmerProduct.find(params[:id])
    @farmer_product.destroy
    redirect_to my_products_path
  end

  private

  def farmer_product_params
    params.require(:farmer_product).permit(:product_id)
  end
end


