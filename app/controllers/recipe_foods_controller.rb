class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods.includes(:user)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    food_id = params[:recipe_food][:food_id].to_i
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(quantity: params[:recipe_food][:quantity], food_id:)
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

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, food_id: Integer)
  end
end
