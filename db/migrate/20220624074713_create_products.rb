class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :item_name,           null: false
      t.text :explanation,           null: false
      t.integer :category_id,        null: false
      t.integer :item_state_id,      null: false
      t.integer :delivery_charge_id, null: false
      t.integer :area_id,            null: false
      t.integer :delivery_day_id,    null: false
      t.integer :selling_price,      null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
