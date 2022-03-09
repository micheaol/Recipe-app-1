Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  get '/public_recipes/:id', to: 'public_recipes#show', as: 'show_public_recipes'
  
  get '/recipes', to: 'recipes#index', as: 'recipes_index'
  get '/recipes/new', to: 'recipes#new', as: 'recipes_new'
  get '/recipes/:recipe_id', to: 'recipes#show', as: 'recipes_show'
  put '/recipes/:recipe_id', to: 'recipes#update', as: 'recipes_update'
  delete '/recipes/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  post '/recipes/:user_id/recipe', to: "recipes#create", as: 'create_recipe'

  # get 'recipes/:recipe_id/food_recipe', to: 'food_recipes#index', as: 'food_recipes'
  # get 'recipes/:recipe_id/food_recipe/:food_recipe_id', to: 'food_recipes#show', as: 'food_recipe'
  get 'recipes/:recipe_id/food_recipes/new', to: 'food_recipes#new', as: 'new_food_recipe'
  get 'recipes/:recipe_id/food_recipes/:food_recipe_id', to: 'food_recipes#edit', as: 'edit_food_recipes'
  put 'recipes/:recipe_id/food_recipes/:food_recipe_id', to: 'food_recipes#update', as: 'update_food_recipes'
  post 'recipes/:recipe_id/food_recipe', to: 'food_recipes#create', as: 'create_food_recipe'
  delete 'recipes/:recipe_id/food_recipe/:food_recipe_id', to: 'food_recipes#destroy', as: 'delete_food_recipe'

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
