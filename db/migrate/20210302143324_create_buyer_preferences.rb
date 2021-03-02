class CreateBuyerPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_preferences do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
