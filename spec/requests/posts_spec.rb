require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user = FactoryBot.create(:user, name: 'Masuma', posts_counter: 0)
    @post = FactoryBot.create(:post, title: 'Sample Post', text: 'Lorem ipsum', author: @user)
  end

  describe 'GET /posts#index' do
    it 'checks If response status was correct' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response).to have_http_status(200)
    end

    it 'checks If a correct template was rendered' do
      get user_posts_path(user_id: @user.id, id: @post.id)
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes correct placeholder text' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response.body).to include('Posts')
    end
  end
  describe 'GET /posts#show' do
    it 'checks if response status was correct' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response).to have_http_status(200)
    end

    it 'should render the show template' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response).to render_template(:show)
    end

    it 'checks if the response body includes correct placeholder text' do
      get user_post_path(user_id: @user.id, id: @post.id)
      expect(response.body).to include('Posts')
    end
  end
end
