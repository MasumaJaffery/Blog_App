module Api
  class PostsController < ApplicationController
    before_action :set_user, :set_post

    def index
      @posts = @user.posts
      render json: @posts
    end

    def show
      render json: @post
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = @user.posts.find(params[:id])
    end
  end
end
