class UsersController < ApplicationController
before_action :signed_in?, only: [:show]

  def show
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
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

  def signed_in?
    unless current_user
      redirect_to new_session_path, notice: 'you are not signed in!'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
