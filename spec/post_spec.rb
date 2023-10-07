# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'Associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe '#update_post_counter' do
    it 'increments the author posts_counter' do
      expect { post.update_post_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#recent_comments' do
    it 'returns the most recent comments for the post' do
      comments = create_list(:comment, 10, post: post)

      recent_comments = post.recent_comments

      expect(recent_comments).to eq(comments.last(5).reverse)
    end

    it 'returns a specified number of recent comments' do
      comments = create_list(:comment, 10, post: post)

      recent_comments = post.recent_comments(3)

      expect(recent_comments).to eq(comments.last(3).reverse)
    end
  end
end
