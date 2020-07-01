class SubsController < ApplicationController
    before_action :current_user_is_moderator?, only: [:edit, :update]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)

        @sub.moderator_id = params[:moderator]

        if @sub.save
            redirect_to sub_url(@sub.id)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def update
        @sub = Sub.find_by(id: params[:id])

        if @sub.update(sub_params)
            redirect_to sub_url(@sub.id)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def current_user_is_moderator? #subs controller
    redirect_to users_url unless current_user.id == Sub.find(params[:id]).moderator_id
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
