class UsersController < ApplicationController

  before_action :authorize, only: [:login, :root_path]

  def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create

  @user = User.new(user_params)
  if @user.save!
    redirect_to login_path
  else
    redirect_to new_user_path
  end
end

def edit
  @user = User.find(params[:id])

end

def update
  @user = User.find(params[:id])

end

def destroy
end

private
  def user_params
    params.require(:user).permit(:name, :email, :bio, :location, :password, :password_confirmation)
  end
end
