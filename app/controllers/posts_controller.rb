class PostsController < ApplicationController
    # This is a way to authenticate a user and %i[new create] is about to control a controller action!
    before_action :authenticate_user!, only: %i[new create]
  def index
    @users = User.find(params[:id])
    @posts = @users.posts
  end
  def show
    @users = User.find(params[:id])
    @posts = @users.posts.find(params[:id])
  end
end
