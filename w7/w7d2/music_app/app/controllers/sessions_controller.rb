class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        
        if user
            log_in_user!(user)
            redirect_to new_user_url
        else
            flash.now[:errors] = ['Invalid credentials']
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
