class CreateFarmerTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :farmer_transactions do |t|
      t.float :total
      t.boolean :pickup
      t.string :status
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :farmer, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
