Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  
  get '/recipes', to: 'recipes#index', as: 'recipes_index'
  get '/recipes/new', to: 'recipes#new', as: 'recipes_new'
  get '/recipes/:recipes_id', to: 'recipes#show_by_id', as: 'recipes_show_by_id'

  get '/shopping_list', to: 'shopping#index', as: 'shopping_index'
  
  get '/inventories', to: 'inventories#index', as: 'inventories_index'
  get '/inventories/new', to: 'inventories#new', as: 'inventories_new'
  get '/inventories/:inventory_id', to: 'inventories#show', as: 'inventories_show'
  post '/inventories/new', to: 'inventories#create', as: 'inventories_create'
  delete '/inventories/:inventory_id', to: 'inventories#destroy', as: 'inventories_destroy'


  get '/foods', to: 'foods#index', as: 'foods_index'
  
end
