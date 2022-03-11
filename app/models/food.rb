class Food < ApplicationRecord
  has_many :inventories
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
end
