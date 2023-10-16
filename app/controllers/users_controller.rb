class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: :comments).find(params[:id])
    @user.posts_counter = @user.posts.count
    @user_posts = @user.posts.includes(:comments)
  end

  def current_user
    User.first
  end
end
