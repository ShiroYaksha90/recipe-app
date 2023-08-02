class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipe
  validates :name, :prepration_time, :cooking_time, :description, :public, presence: true
end
