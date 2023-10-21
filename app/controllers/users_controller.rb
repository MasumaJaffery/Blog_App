class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.posts_counter = @user.posts.count
    @user_posts = @user.posts
  end

  def set_default_role
    self.role ||= :user
  end
end
