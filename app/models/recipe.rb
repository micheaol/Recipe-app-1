class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy

  def self.count(id)
    FoodRecipe.where(recipe_id: id).count
  end

  def self.total(id)
    foods = FoodRecipe.where(recipe_id: id).includes(:food)
    total = 0
    unless foods.empty?
      foods.each do |food|
        total += (food.quantity * food.food.price)
      end
    end
    total
  end
end
