class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, :prepration_time, :cooking_time, :description, :public, presence: true

  def total_price
    4 # code for total price will be added later for public recipe index page
  end
end
