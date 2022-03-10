class CreateInventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.integer :inventory_id
      t.integer :food_id

      t.timestamps
    end
    add_index :inventory_foods, :inventory_id
    add_index :inventory_foods, :food_id

    add_foreign_key :inventory_foods, :inventories
    add_foreign_key :inventory_foods, :foods

  end
end
