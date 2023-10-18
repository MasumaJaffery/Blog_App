require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before do
    @user = FactoryBot.create(:user, name: 'Masuma', photo_url: 'https://robohash.org/taryn.wehner.png?size=120x120&set=set1', posts_counter: 0)
    @post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @comment = FactoryBot.create(:comment, text: 'Sample comment', user: @user, post: @post)
    @second_post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @third_post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @fourth_post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @fifth_post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @sixth_post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
  end

  describe 'show page' do
    it 'shows the title of the post' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.title)
    end

    it 'shows who wrote the post' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@user.name)
    end
    
    it 'shows how many comments it has' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'shows how many likes it has' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'shows a post\'s body.' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@post.text)
    end

    it 'shows the username of each commentor' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@comment.user.name)
    end
    
    it 'shows the comment each commentor left' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content(@comment.text)
    end
  end
end