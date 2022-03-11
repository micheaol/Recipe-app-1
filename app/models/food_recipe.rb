class FoodRecipe < ApplicationRecord
  validates :quantity,
            numericality: { message: 'Quantity greater or equal than 1', only_integer: true,
                            greater_than_or_equal_to: 1 }

  belongs_to :recipe
  belongs_to :food
end
