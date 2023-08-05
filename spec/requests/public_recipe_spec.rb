require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET/index' do
    it 'checks if path is okay' do
      get public_recipes_path
      expect(response).to have_http_status(200)
    end
  end
end
