# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food
  validates :name, :measurement_unit, :price, :quantity, presence: true
end
