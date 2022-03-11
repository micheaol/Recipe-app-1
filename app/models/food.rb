class Food < ApplicationRecord

  validates :name, presence: { message: 'Name must not be blank!' }
  validates :measurement_unit, presence: { message: 'Measurement must not be blank!' }
  validates :price,
  numericality: { message: 'The price should be greater or equal to 1', only_integer: true,
                  greater_than_or_equal_to: 1 }


  has_many :inventories
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
end
