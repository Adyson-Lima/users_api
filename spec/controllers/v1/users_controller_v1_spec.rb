require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  before{ @user = User.create(email: "admin@admin.com", password: "123456") }
  
  describe 'GET /ap1/v1/users' do
    it 'Consegue listar todos os users e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end
  
end
