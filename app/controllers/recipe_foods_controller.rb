class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(params_recipe_foods)
    if @recipe_food.save
      flash[:notice] = 'Recipe successfully added'
      redirect_to recipe_path(@recipe.id)
    else
      render :new
      flash[:notice] = 'Error adding recipe'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
    flash[:notice] = 'Ingredient deleted successfully'
  end

  private

  def params_recipe_foods
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
