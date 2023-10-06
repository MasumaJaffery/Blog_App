class Like < ApplicationRecord
  belongs_to :post
  belongs_to :comment
  after_save :update_like_count

  private

  def update_like_count
    Post.increment_counter(:likes_counter, post_id)
  end
end
