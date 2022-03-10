class CreateInventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.integer :inventories_id
      t.integer :food_id

      t.timestamps
    end
    add_index :inventory_foods, :inventories_id
    add_index :inventory_foods, :food_id

    add_foreign_key :inventory_foods, :inventories, column: :inventories_id
    add_foreign_key :inventory_foods, :foods, column: :food_id

  end
end
