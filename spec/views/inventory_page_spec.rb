require 'rails_helper'
require 'capybara/rspec'

describe 'User index page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save

    @inventory = Inventory.new(name: 'Inventory 1', description: 'Big inventory', user_id: user.id)
    @inventory.save


  end

  it 'Trying to access /inventories without login' do
    visit '/inventories'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end



end
