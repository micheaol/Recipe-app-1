class InventoriesController < ApplicationController
  def index
    @user_inventory = Inventory.where(users_id: 1)
    
  end

  def new
  @user = User.find(1)
  @inventory = Inventory.new
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



  def show
  
  end
end
