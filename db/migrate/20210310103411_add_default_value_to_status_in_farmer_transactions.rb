class AddDefaultValueToStatusInFarmerTransactions < ActiveRecord::Migration[6.0]
  def change
    change_column :farmer_transactions, :status, :string, default: "pending"
  end
end
