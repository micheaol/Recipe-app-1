class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @public_recipes = Recipe.all
    @users = User.all.where("id NOT IN(?)", current_user.id)
  end

  def show
    @public_recipes = Recipe.find(params[:id])
    
  end
end
