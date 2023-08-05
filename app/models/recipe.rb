class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, :prepration_time, :cooking_time, :description, presence: true

  def total_price
    recipe_foods.sum { |item| item.quantity * item.food.price.to_i }
  end
end
