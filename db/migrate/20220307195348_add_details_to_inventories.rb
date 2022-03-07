class AddDetailsToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :name, :string
    add_reference :inventories, :users, null: false, foreing_key: true
  end
end
