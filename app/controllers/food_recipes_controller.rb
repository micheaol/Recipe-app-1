class FoodRecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @foods = Food.where(user_id: current_user)
    @food_recipe = FoodRecipe.new
  end

  def create
    @food_recipe = FoodRecipe.new
    @food_recipe.quantity = params[:quantity]
    @food_recipe.recipe_id = params[:recipe_id]
    @food_recipe.food_id = params[:food_id]
    if @food_recipe.save
      flash[:success] = 'Ingredient added to recipe'
    else
      flash[:error] = 'Ingredient add failed'
    end
    redirect_to recipes_show_path(params[:recipe_id])
  end

  def destroy
    food_recipe = FoodRecipe.find(params[:food_recipe_id])
    food_recipe.destroy
    if food_recipe.destroy
      flash[:success] = 'Ingredient deleted'
    else
      flash[:error] = 'Failed to delete ingredient'
    end
    redirect_to recipes_show_path(params[:recipe_id])
  end

  def edit
    food_recipe = FoodRecipe.find(params[:food_recipe_id])
    @food = Food.find(food_recipe.food_id)
  end

  def update
    @food_recipe = FoodRecipe.find(params[:food_recipe_id])
    new_quantity = params[:quantity]
    @food_recipe.quantity = new_quantity
    @food_recipe.save
    if @food_recipe.save
      flash[:success] = 'Ingredient updated'
    else
      flash[:error] = 'Ingredient updated failed'
    end
    redirect_to recipes_show_path(params[:recipe_id])
  end
end
