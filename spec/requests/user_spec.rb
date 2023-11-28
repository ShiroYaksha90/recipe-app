require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'checks if path is okay' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end
end
