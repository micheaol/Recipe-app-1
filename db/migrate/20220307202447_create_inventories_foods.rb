class CreateInventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories_foods do |t|

      t.timestamps
    end
  end
end
