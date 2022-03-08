Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  
  get '/recipes', to: 'recipes#index', as: 'recipes_index'
  get '/recipes/new', to: 'recipes#new', as: 'recipes_new'
  get '/recipes/:recipe_id', to: 'recipes#show_by_id', as: 'recipes_show_by_id'
  delete '/recipes/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  post '/recipes/:user_id/recipe', to: "recipes#create", as: 'create_recipe'

  get '/shopping_list', to: 'shopping#index', as: 'shopping_index'
  
  get '/inventories', to: 'inventories#index', as: 'inventories_index'
  get '/inventories/new', to: 'inventories#new', as: 'inventories_new'
  get '/inventories/:invetory_id', to: 'inventories#show', as: 'inventories_show'


  get '/foods', to: 'foods#index', as: 'foods_index'
  
end
