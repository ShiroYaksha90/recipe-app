class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def total_price
    0
  end
end
