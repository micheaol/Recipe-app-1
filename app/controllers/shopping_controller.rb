class ShoppingController < ApplicationController
  before_action :authenticate_user!
  # rubocop:disable Metrics/MethodLength
  def show
    @selected_inventory = Inventory.find(params[:inventory_id])
    @selected_recipe = Recipe.find(params[:recipe_id])
    @recipes_food = FoodRecipe.where(recipe_id: params[:recipe_id]).includes(:food)
    @inventories_food = InventoryFood.where(inventory_id: params[:inventory_id]).includes(:food)

    @shopping_bag = []

    @recipes_food.each do |recipe|
      flag = false
      @inventories_food.each do |food|
        next unless recipe.food_id == food.food_id

        flag = true
        next unless recipe.quantity > food.quantity

        @shopping_bag.push({
                             food_name: food.food.name,
                             missing_quantity: "#{recipe.quantity - food.quantity} #{recipe.food.measurement_unit}",
                             price_to_pay: (recipe.quantity - food.quantity) * food.food.price
                           })
      end

      next unless flag == false

      @shopping_bag.push({
                           food_name: recipe.food.name,
                           missing_quantity: "#{recipe.quantity} #{recipe.food.measurement_unit}",
                           price_to_pay: recipe.quantity * recipe.food.price
                         })
    end
  end
  # rubocop:enable Metrics/MethodLength
end
