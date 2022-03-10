class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy

  def self.count(recipe_id)
    counter = FoodRecipe.where(recipe_id: recipe_id).count
    counter
  end

  def self.total(recipe_id)
    foods = FoodRecipe.where(recipe_id: recipe_id).includes(:food)
    total = 0
    unless foods.empty?
      foods.each do |food|
        p food
        total = total + (food.quantity * food.food.price)
      end
    end
    total
  end
end
