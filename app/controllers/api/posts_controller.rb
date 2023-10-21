module Api
  class PostsController < ApplicationController
    before_action :set_user

    def index
      @posts = @user.posts
      render json: @posts
    end

    private

    def set_user
      @user = current_user
      User.find_by(id: params[:user_id])
    
      if @user.nil?
        render json: { error: 'User not found' }, status: :not_found
      end
    end
    
  end
end
