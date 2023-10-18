require 'rails_helper'
RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Masuma',
      photo_url: 'https://avatars.githubusercontent.com/u/112550568?v=4',
      bio: 'Software Engineer',
      posts_counter: 0
    )
    # Create some posts for the user
    @user.posts.create(title: 'Post 1', text: 'Content for Post 1')
    @user.posts.create(title: 'Post 2', text: 'Content for Post 2')
    @user.posts.create(title: 'Post 3', text: 'Content for Post 3')
    visit user_path(@user)
  end
  it 'displays user information' do
    expect(page).to have_selector("img[src*='https://avatars.githubusercontent.com/u/112550568?v=4']")
    expect(page).to have_content('Masuma')
    expect(page).to have_content('Total Posts: 3')
    expect(page).to have_content('Software Engineer')
  end
  it 'displays the first 3 posts' do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end
  it 'displays a button to view all posts' do
    expect(page).to have_link('See All Posts', href: user_posts_path(@user))
  end
  it 'redirects to the post show page when clicking on a post' do
    click_link('Post 1')
    expect(current_path).to eq(user_post_path(@user.id, @user.posts.first.id))
  end
  it 'redirects to the user posts index when clicking "View All Posts"' do
    click_link('See All Posts')
    expect(current_path).to eq(user_posts_path(@user))
  end
end
