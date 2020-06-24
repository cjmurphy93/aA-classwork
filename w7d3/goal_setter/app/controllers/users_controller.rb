class UsersController < ApplicationController
    def index
        render :index
    end
    def show
        # @user = User.find_by(username: params[:username])
        # debugger
        render :show
        # debugger
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login_user!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        self.params.require(:user).permit(:username, :password)
    end
end
