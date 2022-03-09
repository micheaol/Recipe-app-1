class FoodRecipe < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :food, optional: true
end
