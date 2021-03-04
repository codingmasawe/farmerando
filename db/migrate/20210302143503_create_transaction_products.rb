class CreateTransactionProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_products do |t|
      t.references :farmer_transaction, null: false, foreign_key: true
      t.references :buyer_preference, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
