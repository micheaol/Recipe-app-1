class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :food_recipes, dependent: :destroy
end
