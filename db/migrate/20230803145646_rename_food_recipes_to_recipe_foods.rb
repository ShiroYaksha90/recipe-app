class RenameFoodRecipesToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    rename_table :food_recipes, :recipe_foods
  end
end
