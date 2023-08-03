class FoodRecipe < ApplicationRecord
  belongs_to :recipe, foreign_key: :food_id
  belongs_to :food, foreign_key: :recipe_id
  validates :quantity, presence: true
end
