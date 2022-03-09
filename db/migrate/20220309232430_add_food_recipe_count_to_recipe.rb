class AddFoodRecipeCountToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :food_recipe_count, :integer, :default => 0
  end
end
