class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :foods
end
