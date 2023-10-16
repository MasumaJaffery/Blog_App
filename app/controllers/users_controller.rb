class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.posts_counter = @user.posts.count
    @user_posts = @user.posts
  end

  def current_user
    User.first
  end
end
