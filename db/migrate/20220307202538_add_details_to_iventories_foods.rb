class AddDetailsToIventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :inventory_foods, :quantity, :int
    add_reference :inventory_foods, :inventories, null: false, foreing_key: true
    add_reference :inventory_foods, :foods, null: false, foreing_key: true
  end
end
