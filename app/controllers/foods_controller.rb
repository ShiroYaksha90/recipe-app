class FoodsController < ApplicationController
  def index
    @foods = if user_signed_in?
               current_user.foods.includes(:user)
             else
               Food.all.includes([:user])
             end
  end

  def new
    @food = Food.new
  end

  def show; end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
      flash[:notice] = 'Food was Successfully Created'
    else
      render :new
      flash[:notice] = 'Food has not been created'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
