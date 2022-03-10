class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
      t.integer :quantity
      t.integer :recipe_id
      t.integer :food_id
      t.timestamps

    end
    add_index :food_recipes, :recipe_id
    add_index :food_recipes, :food_id

    add_foreign_key :food_recipes, :recipes
    add_foreign_key :food_recipes, :foods

  end
end
