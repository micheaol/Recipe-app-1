class Inventory < ApplicationRecord
  belongs_to :user, optional: true
  has_many :inventories_foods
end
