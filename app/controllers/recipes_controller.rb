class RecipesController < ApplicationController
  def index
    puts 'This is the recipes index'
  end

  def new
    puts 'This is the recipes create form'
  end

  def show_by_id
    puts 'This is the recipes page by ID'
  end
end
