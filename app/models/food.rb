class Food < ApplicationRecord
    has_many :inventories
    has_many :food_recipes 
end