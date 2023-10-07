require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post).counter_cache(true) }
  end

  describe 'methods' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    describe '#update_comment_count' do
      it 'increments the comments_counter of the associated post' do
        create(:comment, post:)
        post.reload
        expect(post.comments_counter).to eq(1)
      end
    end
  end
end
