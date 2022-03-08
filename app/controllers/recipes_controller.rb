class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show_by_id
    puts 'This is the recipes page by ID'
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:recipe][:name]
    @recipe.description = params[:recipe][:description]
    @recipe.users_id = params[:user_id]
    if @recipe.save
      flash[:success] = 'Recipe saved!!'
      redirect_to recipes_index_path
    else
      flash[:error] = 'Recipe save failed'
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe.destroy
    if recipe.destroy
      flash[:success] = 'Recipe deleted'
      redirect_to recipes_index_path
    else
      flash[:error] = 'Recipe delete failed'
    end
  end
end
