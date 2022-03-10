class InventoryFood < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :food, optional: true
end
