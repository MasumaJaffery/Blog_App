require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe '#update_like_count' do
      let(:user) { create(:user) }
      let(:post) { create(:post) }

      it 'increments the likes_counter of the associated post after creating a like' do
        like = create(:like, user: user, post: post)
        post.reload

        expect(post.likes_counter).to eq(1)
      end
    end
  end
end
