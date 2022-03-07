class AddDetailsToRecipies < ActiveRecord::Migration[7.0]
  def change
    add_column :recipies, :name, :string
    add_column :recipies, :preparation_time, :time
    add_column :recipies, :cooking_time, :time
    add_column :recipies, :description, :text
    add_column :recipies, :public, :boolean
    add_reference :recipies, :users, null: false, foreing_key: true 
  end
end
