require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before do
    @user = FactoryBot.create(:user, name: 'Masuma', photo_url: 'https://robohash.org/taryn.wehner.png?size=120x120&set=set1', posts_counter: 0)
    @post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
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
  end
end