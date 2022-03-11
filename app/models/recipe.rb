class Recipe < ApplicationRecord
  validates :name, presence: { message: 'Name must not be blank!' }
  validates :preparation_time, presence: { message: 'Preparation time must not be blank!' }
  validates :cooking_time, presence: { message: 'Cooking time must not be blank!' }
  validates :description, presence: { message: 'Description must not be blank!' }

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
