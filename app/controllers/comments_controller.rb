class CommentsController < ApplicationController
  before_action :set_post

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @post.decrement!(:comments_counter) if @comment.destroy
    redirect_to user_post_path(current_user, @post), notice: 'Comment deleted sucessfully.'
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      flash[:success] = 'You have created a new comment!'
      # Assuming the author is associated with the post
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Encountered an error while creating a new comment.'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
