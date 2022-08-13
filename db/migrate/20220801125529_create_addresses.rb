class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,    null: false
      t.integer    :area_id,      null: false
      t.string     :municipality
      t.string     :house_number
      t.string     :building_name
      t.string     :phone_number
      t.references :buy,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
