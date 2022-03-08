class FoodsController < ApplicationController
  def index
  end

  def show
    @user = Users.find(params[:id])
    @foods = @user.foods.find([:users_id])
    @show_foods = @foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @current_user = Users.find(params[:users_id])
    @new_food = Foods.new(user: @current_user, name: params[:food][:name], measurement_unit: params[:food][:measurement_unit], price: params[:food][:price])

    if @new_food.save!
      flash[:notice] = "Food saved successfully!!"
      # redirect_to foods_index_path(@new_food.users_id)

    else
      flash[:alert] = "Opps! Something went wrong!!!"
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :id)
  end
end
