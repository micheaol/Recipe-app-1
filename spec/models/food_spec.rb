require_relative '../rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'joe', email: 'mail@mail', password: 'password')
    @food = Food.new(name: 'orange', measurement_unit: 'grams', price: 2, user_id: @user.id)
  end

  it 'should have name' do
    expect(@food.name).to eq('orange')
    expect(@food).to be_valid
  end

  it 'should have measurement_unit' do
    expect(@food.measurement_unit).to eq('grams')
    expect(@food).to be_valid
  end

  it 'should have price' do
    expect(@food.price).to eq(2)
    expect(@food).to be_valid
  end

  it 'name should be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'measurement_unit should be present' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'price should be present' do
    @food.price = nil
    expect(@food).to_not be_valid
  end
end
