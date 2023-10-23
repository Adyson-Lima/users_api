require 'rails_helper'

RSpec.describe User, type: :model do
  
  before {@user = User.new}
  
  describe 'Teste de preenchimento dos campos do model User' do
    
    it 'email consegue ser preenchido?' do
      @user.email = "admin@admin.com"
      expect(@user.email).to eq("admin@admin.com")
    end
    
    it 'password consegue ser preenchida?' do
      @user.password = "1234"
      expect(@user.password).to eq("1234")
    end
    
  end
  
  describe 'Teste de validacao do model User' do
    it 'User valido com os campos obrigatorios preenchidos?' do
      @user.email = "joao@user.com"
      @user.password = "12365"
      expect(@user).to be_valid
    end
    
    it 'User invalido com campos obrigatorios em branco?' do
      user = User.new
      expect(user).to be_valid()
    end
  end
  
end
