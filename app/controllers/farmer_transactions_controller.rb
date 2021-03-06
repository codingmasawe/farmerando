# require 'date'

class FarmerTransactionsController < ApplicationController

  def index
    @farmer_transactions = FarmerTransaction.where(buyer_id: current_user)
  end

  def show
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @buyer = FarmerTransaction.find(params[:id]).buyer
    @farmer = FarmerTransaction.find(params[:id]).farmer
    @transaction_product = TransactionProduct.new
  end

  def new
    @farmer_transaction = FarmerTransaction.new
    @farmer_transaction.buyer = User.find(params[:user])
    @farmer_transaction.farmer = current_user
    if @farmer_transaction.save
      redirect_to farmer_transaction_path(@farmer_transaction)
    end
  end

  def confirm
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @farmer_transaction.status = "Confirmed"

    @total = 0

    @farmer_transaction.transaction_products.each do |tp|
      @total += tp.quantity * tp.buyer_preference.price
    end

    @farmer_transaction.total = @total

    @farmer_transaction.save

    redirect_to farmer_transaction_path(@farmer_transaction)
  end

  def request_for_buyer
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @farmer = @farmer_transaction.farmer
    @buyer = @farmer_transaction.buyer
    @total = @farmer_transaction.total
  end

  def accept_transaction
   @farmer_transaction = FarmerTransaction.find(params[:id])
   @farmer_transaction.status = "Accepted"
   @farmer_transaction.save
   redirect_to farmer_transactions_path, notice: "Accepted!"
  end

  def reject_transaction
    @farmer_transaction = FarmerTransaction.find(params[:id])
    @farmer_transaction.status = "Declined"
    @farmer_transaction.save
    redirect_to farmer_transactions_path, notice: "Declined!"
  end


  private


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
