class Inventory < ApplicationRecord
  belongs_to :user, optional: true
  has_many :inventory_food
end
