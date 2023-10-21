class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[new create]
  before_action :authenticate_user!, only: %i[create destroy]
  def index
    @user = User.find(params[:user_id])
    @post = Post.new
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
  end

  def new
    @user = current_user
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = Post.new(post_params.merge(author_id: @user.id))
    if @post.save
      flash[:success] = 'You have created a new post!'
      redirect_to user_posts_path(@user)
    else
      @posts = @user.posts
      render :index
    end
  end

  def destroy
    @post = Post.find(params[:id])
    author = @post.author

    if @post.destroy
      author.decrement(:posts_counter)
      redirect_to user_posts_path(id: author.id), notice: 'Post deleted!'
    else
      redirect_to user_posts_path(id: author.id), alert: 'Unable to delete post.'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
