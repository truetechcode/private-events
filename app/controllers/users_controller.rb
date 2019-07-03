class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.created_events if @user
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:info] = "User has been created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
