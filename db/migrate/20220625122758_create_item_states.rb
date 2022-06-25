class CreateItemStates < ActiveRecord::Migration[6.0]
  def change
    create_table :item_states do |t|

      t.timestamps
    end
  end
end
