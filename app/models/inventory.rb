class Inventory < ApplicationRecord
  validates :name, presence: { message: 'Name must not be blank!' }
  validates :description, presence: { message: 'Description must not be blank' }

  belongs_to :user
  has_many :inventory_food, dependent: :destroy
end
