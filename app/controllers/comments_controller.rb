class CommentsController < ApplicationController
    # This is a way to authenticate a user and %i[new create] is about to control a controller action!
    before_action :set_post
    # Make a new comment Method!
    def new
    @comment = Comment.new
    end
    # Create a comment Method!
    def create
       @comment = Comment.new(params)
       @comment_user = new_user 
       @comment_post = @post

       if @comment.save
           flash.now[:success] = 'You have created a new comment!'
           # it will redirect to a page of comments!
           redirect_to users_posts_path(@comment.post.author_id, @comment.post.id)
        else
            # Handles Error
            flash.now[:error] = 'Encounter error while create a new comment!'
            # render a new (updated) template!
            render new
        end
    end
    # Method for Comment must be in form of Text.
  def comment_params
     params.require(:comment).permit(:text)
  end
   # Method for post a comment on a Post.
  def set_post
    @post = Post.find(params[:post_id])
  end
end