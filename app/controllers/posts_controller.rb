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
  # Here we define a functionality for new user!
  def new
    @users = new_user
    @posts = @users.posts.build
  end
  # Here we define a functionality to create a post!
  def create
    @users = new_user
    @posts = Post.new(
      author: @users,
      title: params[:post][:title],
      text: params[:post][:text],
      likes_counter: 0,
      :comments_counter: 0
    )
    if @posts.save
       flash.now[:success] = 'You have created a new post!'
       # it will redirect to a page of users!
       redirect_to users_posts_path(@users)
    else
        # Handles Error
        flash.now[:error] = 'Encounter error while create a new post!'
        # render a new (updated) template!
        render new
    end
  end
  private
  # Mechanism to post data
  def post_data
    params.require(:post).permit(:title, :text)
  end
end
