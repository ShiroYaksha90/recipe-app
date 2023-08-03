# frozen_string_literal: true

class FoodsController < ApplicationController
  def index
    @foods = Food.all.includes(:user)
  end

  def new
    @food = Food.new
  end

  def show; end

  def create
    @food = Food.new(params_foods)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
      flash[:notice] = 'Food was successfully created'
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

  def params_foods
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
