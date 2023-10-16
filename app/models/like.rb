class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :update_like_count

  private

  def update_like_count
    Post.increment_counter(:likes_counter, post_id)
  end
end
