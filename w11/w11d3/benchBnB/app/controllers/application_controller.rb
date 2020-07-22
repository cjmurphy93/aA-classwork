class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def login!(user)
      session[:session_token] = user.session_token
    end

    def logout!
      return false if !logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
      return true
    end

    def current_user
      return nil unless session[:session_token]
      @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def logged_in?
      !current_user.nil?
    end
end
