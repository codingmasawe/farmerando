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

  def show
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @buyer = FarmerTransaction.find(params[:id]).buyer
    @farmer = FarmerTransaction.find(params[:id]).farmer
    @transaction_product = TransactionProduct.new
  end

  def confirm
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @farmer_transaction.status = "confirmed"

    @buyer = FarmerTransaction.find(params[:id]).buyer
    @farmer = FarmerTransaction.find(params[:id]).farmer
    @transaction_product = TransactionProduct.new

    if @farmer_transaction.status == "confirmed"
      redirect_to (@farmer_transaction)
    end
  end

  private

  def transaction_product_params
    params.require(:transaction_product).permit(:farmer_transaction_id, :buyer_preference)
  end

  def farmer_transaction_params
    params.require(:farmer_transaction).permit(:buyer_id, :farmer_id)
  end
end


# Confirm the trasaction would be like the accept and reject of airbnb
# 1/ Custom route
# get '/confirm/:id', to: 'farmer_transactions#confirm'
# 2/ method in FarmerTransactions controller
# def confirm
# @farmer_transaction = FarmerTransaction.find(params[:id])
# # change status of transaction and redirect to the show of farmtransaction
# 3/ link in view (edited)
