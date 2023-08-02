class RecipesController < ApplicationController
  before_action  :authenticate_user!, only: %i[show edit update destroy]
  before_action :set_recipe, only: %i[show update]

  def index
    @recipes = Recipe.all.includes([:user]).where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to user_recipes_path(current_user.id), notice: 'Recipe Added successfully!'
    else
      render :show
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
    @recipe = @user.recipe.find(params[:id])
    # @recipe_food = @recipe.recipe_foods
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description, :public)
  end
end
