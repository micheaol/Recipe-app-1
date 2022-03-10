class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public, default: false
      t.integer :user_id
      t.timestamps
    end
    add_index :recipes, :user_id
    add_foreign_key :recipes, :users

  end
end
