class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @public_recipes = Recipe.where(public: true).includes(:user)
  end

  def show
    @public_recipes = Recipe.find(params[:id])
  end
end
