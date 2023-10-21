module Api
  class CommentsController < ApplicationController
    before_action :set_user, :set_post

    def index
      @coments = @post.comments
      render json: @comments
    end

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = @user.posts.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
