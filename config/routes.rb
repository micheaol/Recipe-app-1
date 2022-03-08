Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  get '/public_recipes/:id', to: 'public_recipes#show', as: 'show_public_recipes'
  
  get '/recipes', to: 'recipes#index', as: 'recipes_index'
  get '/recipes/new', to: 'recipes#new', as: 'recipes_new'
  get '/recipes/:recipe_id', to: 'recipes#show_by_id', as: 'recipes_show_by_id'
  delete '/recipes/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  post '/recipes/:user_id/recipe', to: "recipes#create", as: 'create_recipe'

  get '/shopping_list', to: 'shopping#index', as: 'shopping_index'
  
  get '/inventories', to: 'inventories#index', as: 'inventories_index'
  get '/inventories/new', to: 'inventories#new', as: 'inventories_new'
  get '/inventories/:inventory_id', to: 'inventories#show', as: 'inventories_show'
  post '/inventories/new', to: 'inventories#create', as: 'inventories_create'
  delete '/inventories/:inventory_id', to: 'inventories#destroy', as: 'inventories_destroy'


  get '/foods', to: 'foods#index', as: 'foods_index'
  get '/foods/new', to: 'foods#new', as: 'foods_new'
  post '/foods/:user_id', to: 'foods#create', as: 'create_foods_form'
  get '/foods/:id', to: 'foods#show', as: 'foods_show'
  get '/foods/:id/destroy', to: 'foods#destroy', as: 'foods_destroy'
  
end
