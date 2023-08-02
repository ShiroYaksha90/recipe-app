# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipefood
  validates :name, :prepration_time, :cooking_time, :description, :public, presence: true
end
