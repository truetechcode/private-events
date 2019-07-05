class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_to user_path(user.id)        
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      render 'new'            
    end
  end   
end
