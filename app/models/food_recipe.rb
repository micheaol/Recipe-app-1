class FoodRecipe < ApplicationRecord
  belongs_to :recipe, :counter_cache => true, optional: true
  belongs_to :food, optional: true

 
  def food_recipe_count(counter)
    recipe.update(food_recipe_count: counter)
  end
end
