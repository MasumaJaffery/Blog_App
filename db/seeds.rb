# Ensure you have 'faker' gem included in your Gemfile and installed

# Create 5 users who will create posts and comments
5.times do
  user = User.create!(
    name: Faker::Name.name,
    photo_url: Faker::Avatar.image(slug: Faker::Internet.unique.username, size: "120x120"),
    bio: Faker::Lorem.sentence(word_count: rand(7..15)),
    posts_counter: 0
  )

  # Create 3 posts for each user
  3.times do
    post = user.posts.create!(
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph(sentence_count: rand(10..20)),
      comments_counter: 0,
      likes_counter: 0
    )

    # Create 5 comments for each post by the same user
    5.times do
      post.comments.create!(
        user: user, # The same user is creating the comment
        text: Faker::Lorem.sentence(word_count: rand(1..10))
      )
    end
  end
end
