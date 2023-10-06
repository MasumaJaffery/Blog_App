class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :Update_comment_count

  private

  def Update_comment_count
    Post.increment_counter(:comments_counter, post_id)
  end
end
