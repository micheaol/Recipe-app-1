require 'rails_helper'
require 'capybara/rspec'

describe 'User inventory page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save

    Recipe.create!(name: 'Recipe 1', description: 'Best recipe ever',
                   preparation_time: '2 hours', cooking_time: '1 hour', user_id: user.id, public: true)

    sign_in user
  end

  it 'When I access my recipes I can see add new recipe button' do
    visit '/recipes'
    expect(page).to have_content('Create new recipe')
  end

  it 'When I access my recipes I can see my recipes saved' do
    visit '/recipes'
    expect(page).to have_content('Recipe 1')
  end

  it 'When I access my recipes page I have <a> tags to see more info about recipes' do
    visit '/inventories'
    expect(page).to have_css('a')
  end

  it 'When I access my recipes I can see menu button' do
    visit '/inventories'
    expect(page).to have_content('Menu')
  end
end

describe 'User recipes page without login', type: :feature do
  it 'When I access /recipes without login' do
    visit '/recipes'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
