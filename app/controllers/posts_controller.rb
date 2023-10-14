class PostsController < ApplicationController
  # This is a way to authenticate a user, and %i[new create] specify controller actions where authentication is required
  before_action :authenticate_user!, only: %i[new create]

  def index
    # Find the user by their ID from the route
    @user = User.find(params[:user_id])
    # Retrieve the posts for the user
    @posts = @user.posts
    render :index
  end

  def show
    # Find the user by their ID from the route
    @user = User.find(params[:user_id])
    # Find the post for the user by its ID
    @post = @user.posts.find(params[:id])
  end

  def new
    # Get the current user
    @user = current_user
    # Build a new post associated with the user
    @post = @user.posts.build
  end

  def create
    # Get the current user
    @user = current_user
    # Build a new post with the provided parameters
    @post = Post.new(
      author: @user,
      title: params[:post][:title],
      text: params[:post][:text],
      likes_counter: 0,
      comments_counter: 0
    )
    if @post.save
      flash[:success] = 'You have created a new post!'
      # Redirect to the user's posts page
      redirect_to user_posts_path(@user)
    else
      # Handle errors
      flash.now[:error] = 'Encountered an error while creating a new post!'
      # Render the 'new' template
      render :new
    end
  end

  private
  # Define a private method to permit post data
  def post_data
    params.require(:post).permit(:title, :text)
  end
end
# Feliz Codificacion!
