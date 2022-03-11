require 'rails_helper'
require 'capybara/rspec'

describe 'User index page', type: :feature do
  before :each do
    @public_recipe = Recipe.new(name: 'Post 1', description: 'Best recipe ever',
                      preparation_time: '2 hours', cooking_time: '1 hour', user_id: 1, public: true)
    @public_recipe.save
    public_recipe2 = Recipe.new(name: 'Post 2', description: 'Best recipe ever',
        preparation_time: '2 hours', cooking_time: '1 hour', user_id: 1, public: true)
    public_recipe2.save

  end

  it 'I can see the name of the public posts' do
    visit '/'
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
  end

  it 'I can see the button to open menu' do
    visit '/'
    expect(page).to have_content('Menu')

  end

  it 'The public_post page should have <a> tags to see the posts' do
    visit '/'
    expect(page).to have_css('a')
  end


end
