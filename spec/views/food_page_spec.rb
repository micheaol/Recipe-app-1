require 'rails_helper'
require 'capybara/rspec'

describe 'User food page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save
    
    Food.create!(name: 'Food 1', measurement_unit: 'Unit', user_id: user.id, price: 1)


    sign_in user



  end

  
  it 'When I access my food I can see add new food button' do
    visit '/foods'
    expect(page).to have_content('Add new Food')
  end
  
  it 'When I access my food I can see my food saved' do
    visit '/foods'
    expect(page).to have_content('Food 1')
  end
  
  it 'When I access my recipes page I have <a> tags to see more info about recipes' do
    visit '/foods'
    expect(page).to have_css('a')
  end
  
  it 'When I access my food I can see menu button' do
    visit '/foods'
    expect(page).to have_content('Menu')
  end
  
end

describe 'User foods page without login', type: :feature do
  it 'When I access /food without login' do
    visit '/foods'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end