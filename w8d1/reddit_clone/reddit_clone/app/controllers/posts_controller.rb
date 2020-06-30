class PostsController < ApplicationController
    before_action :current_user_is_author?, only: [:edit, :update]

    def new
      @post = Post.new
      render :new
    end
    
    def show
      @post = Post.find(params[:id])
      render :show
    end

    def index
      @posts = Post.all
      render :index
    end

    def create
      @post = Post.new(post_params)
      @post.author_id = params[:author]
      @post.sub_id = params[:sub]

      if @post.save
        redirect_to sub_url(@post.sub_id)
      else
        flash.now[:errors] = ['Post Must Not Be Blank']
        render :new
      end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        @post.author_id = params[:author_id]

        if @post.update(post_params)
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
      @post = current_user.posts.find_by(id: params[:id])
      if @post && @post.delete
        redirect_to sub_url(@post.sub_id)
      end
    end

    def current_user_is_author? #posts controller# Sub.find(params[:author_id])
    redirect_to users_url unless current_user.id == Post.find(params[:id]).author_id
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
