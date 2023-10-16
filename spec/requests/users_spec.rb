require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user, name: 'Masuma', posts_counter: 0)
  end

  describe 'GET /users#index' do
    it 'checks if response status was correct' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'checks if it renders a template' do
      get root_path
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes correct placeholder text' do
      get root_path
      expect(response.body).to include('Masuma')
    end
  end

  describe 'GET /user#show' do
    it 'checks if response status was correct' do
      get user_path(@user.id)
      expect(response).to have_http_status(200)
    end

    it 'should render the show template' do
      user = User.create(name: 'Masuma', posts_counter: 0)
      get user_path(user.id)
      expect(response).to render_template(:show)
    end

    it 'checks if the response body includes correct placeholder text' do
      get user_path(@user.id)
      expect(response.body).to include('Masuma')
    end
  end
end
