class AddDetailsToFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :food_recipes , :quantity, :int
    add_reference :food_recipes, :recipes, null: false, foreing_key: true
    add_reference :food_recipes, :foods, null: false, foreing_key: true
  end
end
