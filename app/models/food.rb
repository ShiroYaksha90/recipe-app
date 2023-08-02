class Food < ApplicationRecord
  belongs_to :user
  has_many :food_recipe
  validates :name, :measurement_unit, :price, :quantity, presence: true
end
