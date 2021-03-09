class TransactionProductsController < ApplicationController
  def create
    @farmer_transaction = FarmerTransaction.find(params[:farmer_transaction_id])

    @transaction_product = TransactionProduct.new(transaction_product_params)
    @transaction_product.farmer_transaction = @farmer_transaction

    if @transaction_product.save
      @total = 0

      @farmer_transaction.transaction_products.each do |tp|
        @total += tp.quantity * tp.buyer_preference.price
      end

      @farmer_transaction.total = @total

      @farmer_transaction.save

      redirect_to farmer_transaction_path(@farmer_transaction)
    else
      redirect_to farmer_transaction_path(@farmer_transaction), notice: "Please choose a quantity"
    end
  end

  private

  def transaction_product_params
    params.require(:transaction_product).permit(:buyer_preference_id, :quantity)
  end
end
