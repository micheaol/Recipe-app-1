class Inventory < ApplicationRecord
    belongs_to :user
    has_many :inventories_foods
end