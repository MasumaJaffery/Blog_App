class Like < ApplicationRecord
  belongs_to :post
  belongs_to :comment
  after_save :Update_like_count

  private

  def Update_like_count
    Post.increment_counter(:likes_counter, post_id)
  end
end
