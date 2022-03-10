class AddFoodsRefToFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_recipes, :food_id, null: true, foreign_key: true
  end
end
