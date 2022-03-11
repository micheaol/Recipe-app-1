require 'rails_helper'
require 'capybara/rspec'

describe 'User index page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save

    @food = Food.new(name: 'Food 1', measurement_unit: 'Unit', user_id: user.id, price: 3.30)
    @food.save


  end

  it 'Trying to access /foods without login' do
    visit '/foods'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end



end
