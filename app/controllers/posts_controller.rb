class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.new
    @posts = @user.posts
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

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
