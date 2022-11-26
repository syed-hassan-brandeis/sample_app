module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if @current_user.nil?
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user.
    def log_out
        reset_session
        @current_user = nil
    end
end
