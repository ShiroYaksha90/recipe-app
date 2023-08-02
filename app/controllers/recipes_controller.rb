class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipe
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.build
  end

  def create
    @recipe = current_user.recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to user_recipes_path(current_user, @recipe), notice: 'Recipe was successfully created.'
    else
      render :new
      flash[:notice] = 'Recipe was not created.'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user_id
  rescue ActiveRecord::RecordNotFoundError
    redirect_to root_path
  end

  def destroy
    set_recipe
    @recipe.recipe_foodss.destroy_all
    if @recipe.destroy
      flash[:notice] = 'Recipe was deleted successfully.'
      redirect_to user_recipes_path
    else
      render 'Error', status: unprocessable_entity
    end
  end

  private

  def set_recipe
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @recipe_food = @recipe.recipe_foods
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description, :public)
  end
end
