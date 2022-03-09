class Food < ApplicationRecord
  has_many :inventories
  has_many :food_recipes
  belongs_to :user, optional: true
  has_many :food_recipes, dependent: :destroy
end
