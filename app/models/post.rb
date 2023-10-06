class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
