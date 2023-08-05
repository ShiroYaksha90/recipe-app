require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'Willow', email: 'willow@gmail.com', password: 'password123')
    @recipe = Recipe.create(user: @user, name: 'spring rolls', preparation_time: 10, cooking_time: 15,
                            description: 'nice meal', public: true)
    @food = Food.create(name: 'chicken', user: @user, price: 5, measurement_unit: 'kg', quantity: 4, user_id: @user.id)
    @recipe_food = @recipe.recipe_foods.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'checks if recipe food creation is successful' do
    expect(@recipe_food).to be_valid
  end

  it 'checks it is not valid without a recipe id ' do
    @recipe_food.recipe_id = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'checks it is not valid without a food id ' do
    @recipe_food.food_id = nil
    expect(@recipe_food).to_not be_valid
  end
end
