class Api::V1::UsersController < ApplicationController
  
  before_action :set_user, only: %i[show update destroy]
  
  def index
    @users = User.all
    render json: @users
  end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :password)
end
  
end
