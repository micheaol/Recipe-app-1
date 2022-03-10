class FoodRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

 
  def recipe_counter
    @recipe = FoodRecipe.includes(:food).where(:recipe_id => 2)
    puts 'hi'
  end
end
