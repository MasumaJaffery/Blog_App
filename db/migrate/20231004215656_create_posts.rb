class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.integer :author_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
# first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)