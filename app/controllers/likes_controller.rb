class LikesController < ApplicationController
  before_action :set_post

  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.post = @post
    @like.user = current_user

    if @like.save
      flash[:notice] = 'the like has been added successfully!'
      redirect_to user_post_path(@like.post.author_id, @like.post.id)
    else
      flash.now[:error] = 'An error has occurred'
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
