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
  
  describe 'GET /api/v1/users/id' do
    it 'Consegue listar um user especifico e retornar status 200?' do
      get :show, params: {id: @user.id}
      expect(response.body).to include_json(id: @user.id)
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST /api/v1/users' do
    it 'Consegue criar um user e retornar status 201?' do
      post :create, params: {user: {email: @user.email, password: @user.password},format: :json}
      
      expect(response.body).to include_json(email: @user.email)
      expect(response).to have_http_status(201)
    end
  end
  
  describe 'PATCH /api/v1/users/id' do
    it 'Consegue atualizar um user e retornar status 200?' do
      user = User.last
      patch :update, params: {user: {email: "user@email.com", password: user.password}, id: user.id}
      
      expect(response.body).to include_json(email: "user@email.com")
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'DELETE /api/v1/users/id' do
    it 'Consegue apagar um user e retornar 204?' do
      user = User.last
      delete :destroy, params: {id: user.id}
      
      expect(User.all).not_to include(user)
      expect(response).to have_http_status(204)
    end
  end
  
end
