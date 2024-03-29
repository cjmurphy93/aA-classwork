class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    def current_user
        return nil unless session[:sesion_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    
    def logged_in?
        !!current_user
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!(user)
        session[:session_token] = nil
        user.reset_session_token!
    end
end
