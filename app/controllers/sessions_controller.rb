class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_to user_path(user.id)
      flash.now[:success] = 'You are signed in!'
    else
      flash.now[:danger] = 'Invalid username!'
      render 'new'            
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
