class CreateUserMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_markets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
