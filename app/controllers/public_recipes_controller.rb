class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @food_recipe = FoodRecipe.all
    @public_recipes = Recipe.all
    @users = User.all.where('id NOT IN(?)', current_user.id)
    @count = FoodRecipe.pluck(:recipes_id)
  end

  # def foods_per_recipe
  #   recipes.select('recipes.id, recipes.name, count(foods.id) as count')
  #             .group('recipes.id, recipes.name').map do |c|
  #     {
  #       name: c.name,
  #       count: c.count
  #     }
  #   end
  # end

  def show
    @public_recipes = Recipe.find(params[:id])

  end
end
