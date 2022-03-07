class AddDetailsToIventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories_foods, :quantity, :int
    add_reference :inventories_foods, :inventories, null: false, foreing_key: true
    add_reference :inventories_foods, :foods, null: false, foreing_key: true
  end
end
