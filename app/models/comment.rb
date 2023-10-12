class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  after_create :update_comment_count

  private

  def update_comment_count
    post.update_attribute(:comments_counter, post.comments.count)
  end
end
