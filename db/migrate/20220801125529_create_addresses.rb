class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,    null: false
      t.integer    :area_id,      null: false
<<<<<<< HEAD
      t.string     :municipality
      t.string     :house_number
      t.string     :building_name
      t.string     :phone_number
=======
      t.string     :municipality, null: false
      t.string     :house_number, null: false
      t.string     :building_name
      t.string     :phone_number, null: false
>>>>>>> parent of d05285f (Revert "マイグレーションを修正した")
      t.references :buy,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
