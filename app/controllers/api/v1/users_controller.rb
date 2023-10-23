class Api::V1::UsersController < ApplicationController
  
  before_action :set_user, only: %i[show update destroy]
  
  def index
    @users = User.all
    render json: @users
  end
  
  def show
    render json: @user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :internal_server_error
    end
  end

private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:email, :password)
end
  
end
