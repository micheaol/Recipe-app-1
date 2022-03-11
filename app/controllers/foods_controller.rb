class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @show_foods = Food.where(user_id: current_user.id)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @current_user = params[:user_id]
    @new_food = Food.new(user_id: @current_user, name: params[:food][:name],
                         measurement_unit: params[:food][:measurement_unit], price: params[:food][:price])

    if @new_food.save!
      flash[:notice] = 'Food saved successfully.'
      redirect_to foods_index_path

    else
      flash[:alert] = 'Opps! Something went wrong.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food deleted successfully'
    else
      flash[:alert] = 'Opps! Something went wrong'
    end
    redirect_to foods_index_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
