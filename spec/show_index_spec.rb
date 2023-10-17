require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before do
    @user = FactoryBot.create(:user, name: 'Masuma', photo_url: 'https://robohash.org/taryn.wehner.png?size=120x120&set=set1', posts_counter: 0)
    @post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
    @comment = FactoryBot.create(:comment, text: 'Sample comment', user: @user, post: @post)
  end

  describe 'index page' do
    it 'shows the image of the user' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_xpath(".//img[@src='#{@user.photo_url}']")
    end

    it 'shows the user\s username' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@user.name)
    end
    
    it 'can see the number of posts the user has written.' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content("Total Posts: #{@user.posts_counter}")
    end

    it 'can see a post\'s title.' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.title)
    end

    it 'can see a post\'s body.' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@post.text)
    end

    it 'can see the first comment of a post' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_content(@comment.text)
    end
  end
end