class InventoriesController < ApplicationController
  def index
    @user_inventory = Inventory.where(users_id: 1)
    puts 'hereee'
    
  end

  def new; end

  def show; end
end
