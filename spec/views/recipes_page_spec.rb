require 'rails_helper'
require 'capybara/rspec'

describe 'User index page', type: :feature do
  before :each do
    user = User.new(name: 'Rafael', email: 'email@test.com', password: '123456')
    user.save

    @public_recipe = Recipe.new(name: 'Post 1', description: 'Best recipe ever',
                      preparation_time: '2 hours', cooking_time: '1 hour', user_id: user.id, public: true)
    @public_recipe.save


  end

  it 'Trying to access /recipes without login' do
    visit '/recipes'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end



end
