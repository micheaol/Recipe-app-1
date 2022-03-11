require_relative '../rails_helper'

RSpec.describe InventoryFood, type: :model do
  before :each do
    @user = User.create(name: 'joe', email: 'mail@mail', password: 'password')
    @inventory = Inventory.create(name: 'inventory 1', description: 'my description', user_id: @user.id)
    @food = Food.create(name: 'orange', measurement_unit: 'grams', price: 2, user_id: @user.id)
    @inventory_food = InventoryFood.new(quantity: 5, inventory_id: @inventory.id, food_id: @food.id)
  end

  it 'should have quantity' do
    expect(@inventory_food.quantity).to eq(5)
    expect(@inventory_food).to be_valid
  end

  it 'should have inventory_id' do
    expect(@inventory_food.inventory_id).to eq(@inventory.id)
    expect(@inventory_food).to be_valid
  end

  it 'should have food_id' do
    expect(@inventory_food.food_id).to eq(@food.id)
    expect(@inventory_food).to be_valid
  end

  it 'name should be present' do
    @inventory_food.quantity = nil
    expect(@inventory_food).to_not be_valid
  end

  it 'inventory_id should be present' do
    @inventory_food.inventory_id = nil
    expect(@inventory_food).to_not be_valid
  end

  it 'food_id should be present' do
    @inventory_food.food_id = nil
    expect(@inventory_food).to_not be_valid
  end
end
