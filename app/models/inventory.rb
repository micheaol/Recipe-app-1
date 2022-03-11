class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_food, dependent: :destroy
end
