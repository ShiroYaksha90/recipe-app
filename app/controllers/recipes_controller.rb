class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes([:user])
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params_recipe)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      render :new
      flash[:notice] = 'Error adding recipe'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully destroyed'
    redirect_to recipes_path
  end

  private

  def params_recipe
    params.require(:recipe).permit(:name, :preparation_time, :description, :public, :cooking_time)
  end
end
