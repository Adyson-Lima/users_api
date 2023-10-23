require 'rails_helper'

RSpec.describe User, type: :model do
  
  before {@user = User.new}
  
  describe 'Teste de preenchimento dos campos do model User' do
    
    it 'email consegue ser preenchido?' do
      @user.email = ""
      expect(@user.email).to eq("admin@admin.com")
    end
    
  end
  
end
