require_relative '../rails_helper'

RSpec.describe Inventory, type: :model do
  before :each do
    @user = User.create(name: 'joe', email: 'mail@mail', password: 'password')
    @inventory = Inventory.new(name: 'inventory 1', description: 'my description', user_id: @user.id)
  end

  it 'should have name' do
    expect(@inventory.name).to eq('inventory 1')
    expect(@inventory).to be_valid
  end

  it 'should have description' do
    expect(@inventory.description).to eq('my description')
    expect(@inventory).to be_valid
  end

  it 'name should be present' do
    @inventory.name = nil
    expect(@inventory).to_not be_valid
  end

  it 'description should be present' do
    @inventory.description = nil
    expect(@inventory).to_not be_valid
  end
end
