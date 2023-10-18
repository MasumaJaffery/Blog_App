require 'rails_helper'

RSpec.feature 'User Index Page' do
  scenario 'displays user information' do
    user1 = User.create(
      name: 'Masuma',
      photo_url: 'https://avatars.githubusercontent.com/u/112550568?v=4',
      bio: 'Software Engineer',
      posts_counter: 6
    )
    user2 = User.create(
      name: 'Javier',
      photo_url: 'https://avatars.githubusercontent.com/u/109859994?v=4',
      bio: 'Full-Stack Developer',
      posts_counter: 0
    )
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_selector("img[src*='#{user1.photo_url}']")
    expect(page).to have_content("Total Posts: #{user1.posts_counter}")
    expect(page).to have_link(user1.name, href: user_path(user1))
    expect(page).to have_content(user2.name)
    expect(page).to have_selector("img[src*='#{user2.photo_url}']")
    expect(page).to have_content("Total Posts: #{user2.posts_counter}")
    expect(page).to have_link(user2.name, href: user_path(user2))
  end
end
