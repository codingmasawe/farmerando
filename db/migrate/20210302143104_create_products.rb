class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :market, null: false, foreign_key: true
      t.string :img_url, default: ""


      t.timestamps
    end
  end
end
