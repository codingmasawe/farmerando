# require 'date'

class FarmerTransactionsController < ApplicationController

  def new
    @farmer_transaction = FarmerTransaction.new

    @farmer_transaction.buyer = User.find(params[:user])
    @farmer_transaction.farmer = current_user

    if @farmer_transaction.save
      redirect_to (@farmer_transaction)
    end
  end

  # def create
  #   @farmer_transaction = FarmerTransaction.new(farmer_transaction_params)
  #   @farmer_transaction.farmer_id = current_user


  #   @buyer_preference.user = current_user
  #   @buyer_preference.product = Product.find(params[:buyer_preference][:product_id])
  #   if @buyer_preference.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @buyer = FarmerTransaction.find(params[:id]).buyer
    @transaction_product = TransactionProduct.new
  end

  private

  def transaction_product_params
    params.require(:transaction_product).permit(:farmer_transaction_id, :buyer_preference)
  end

  def farmer_transaction_params
    params.require(:farmer_transaction).permit(:buyer_id, :farmer_id)
  end
end
