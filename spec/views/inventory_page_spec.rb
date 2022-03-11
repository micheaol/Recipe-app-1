require 'rails_helper'
require 'capybara/rspec'

describe 'User inventory page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save

    Inventory.create!(name: 'Inventory 1', description: 'Big inventory', user_id: user.id)

    sign_in user
  end

  it 'When I access my inventory I can see add new inventory button' do
    visit '/inventories'
    expect(page).to have_content('New inventory')
  end

  it 'When I access my inventory I can see my inventory saved' do
    visit '/inventories'
    expect(page).to have_content('Inventory 1')
  end

  it 'When I access my inventory page I have <a> tags to see more info about inventory' do
    visit '/inventories'
    expect(page).to have_css('a')
  end

  it 'When I access my inventory I can see menu button' do
    visit '/inventories'
    expect(page).to have_content('Menu')
  end
end

describe 'User inventory page without login', type: :feature do
  it 'When I access /inventories without login' do
    visit '/inventories'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
