class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy

  def self.count(recipe_id)
    FoodRecipe.where(recipe_id:).count
  end

  def self.total(recipe_id)
    foods = FoodRecipe.where(recipe_id:).includes(:food)
    total = 0
    unless foods.empty?
      foods.each do |food|
        total += (food.quantity * food.food.price)
      end
    end
    total
  end
end
