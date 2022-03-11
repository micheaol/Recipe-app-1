require_relative '../rails_helper'

RSpec.describe FoodRecipe, type: :model do
  before :each do
    @user = User.create(name: 'joe', email: 'mail@mail', password: 'password')
    @recipe = Recipe.create(name: 'first recipe', preparation_time: '1 hour', cooking_time: '30 minutes',
                            description: 'recipe description', user_id: @user.id)
    @food = Food.create(name: 'orange', measurement_unit: 'grams', price: 2, user_id: @user.id)
    @food_recipe = FoodRecipe.new(quantity: 5, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'should have quantity' do
    expect(@food_recipe.quantity).to eq(5)
    expect(@food_recipe).to be_valid
  end

  it 'should have recipe_id' do
    expect(@food_recipe.recipe_id).to eq(@recipe.id)
    expect(@food_recipe).to be_valid
  end

  it 'should have food_id' do
    expect(@food_recipe.food_id).to eq(@food.id)
    expect(@food_recipe).to be_valid
  end

  it 'name should be present' do
    @food_recipe.quantity = nil
    expect(@food_recipe).to_not be_valid
  end

  it 'recipe_id should be present' do
    @food_recipe.recipe_id = nil
    expect(@food_recipe).to_not be_valid
  end

  it 'food_id should be present' do
    @food_recipe.food_id = nil
    expect(@food_recipe).to_not be_valid
  end
end
