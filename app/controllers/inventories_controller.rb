class InventoriesController < ApplicationController
  def index
    @user_inventory = Inventory.where(users_id: current_user.id)
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @selected_inventory = Inventory.find(params[:inventory_id])
    @selected_inventory_foods = InventoryFood.where(inventories_id: params[:inventory_id])
  end

  def create
    @inventory = Inventory.new
    @inventory.name = params[:inventory][:name]
    @inventory.description = params[:inventory][:description]
    @inventory.users_id = current_user.id

    if @inventory.save
      flash[:success] = 'Inventory successfully created.'
      redirect_to inventories_index_path

    else
      p @inventory.errors.full_messages
      flash[:error_title] = @inventory.errors.messages[:name][0]
      flash[:error_comment] = @inventory.errors.messages[:description][0]
      redirect_to inventories_new_path
    end
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @inventory.destroy
    flash[:success] = 'Inventory successfully deleted'
    redirect_to inventories_index_path
  end

  def destroy_food
    @food_to_delete = InventoryFood.where(inventories_id: params[:inventory_id], foods_id: params[:foods_id]).first
    p @food_to_delete
    if @food_to_delete.destroy

      flash[:success] = 'Food delete from inventory successfully.'
    else
      flash[:error] = 'Opps! Something went wrong'
    end

    redirect_to inventories_show_path(params[:inventory_id])
  end

  def newfood_inventory
    @foods = Food.all
    @selected_inventory = Inventory.find(params[:inventory_id])
  end

  def post_newfood_inventory
    @inventory_food = InventoryFood.new
    p params[:quantity]
    p params[:inventory_id]
    p params[:food_id]
    @inventory_food.quantity = params[:quantity].to_i
    @inventory_food.inventories_id = params[:inventory_id].to_i
    @inventory_food.foods_id = params[:food_id].to_i
    if @inventory_food.save
      flash[:success] = 'Food added to inventory!'
    else
      p @inventory_food.errors.full_messages
      flash[:error] = 'Food add failed'
    end
    redirect_to inventories_show_path(params[:inventory_id])
  end
end
