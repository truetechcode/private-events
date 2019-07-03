module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end    

    def current_user 
        if (user_id = session[:user_id])
          @current_user ||= User.find_by(id: user_id)
        end
    end

    def logged_in?
        !current_user.nil?
    end  

        # Forgets a persistent session.
    def forget(user)
        # user.forget
    end

        # Logs out the current user.
    def log_out
        # forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end    
        
end