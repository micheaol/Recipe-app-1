require_relative '../rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'joe', email: 'mail@mail', password: 'password')
    @recipe = Recipe.new(name: 'first recipe', preparation_time: '1 hour', cooking_time: '30 minutes',
                         description: 'recipe description', user_id: @user.id)
  end

  it 'should have name' do
    expect(@recipe.name).to eq('first recipe')
    expect(@recipe).to be_valid
  end

  it 'should have preparation_time' do
    expect(@recipe.preparation_time).to eq('1 hour')
    expect(@recipe).to be_valid
  end

  it 'should have cooking_time' do
    expect(@recipe.cooking_time).to eq('30 minutes')
    expect(@recipe).to be_valid
  end

  it 'should have description ' do
    expect(@recipe.description).to eq('recipe description')
    expect(@recipe).to be_valid
  end

  it 'name should be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be present' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be present' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'description should be present' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end
end
