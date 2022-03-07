class RenameFoodRecipies < ActiveRecord::Migration[7.0]
  def change
    rename_table :food_recipies, :food_recipes
  end
end
