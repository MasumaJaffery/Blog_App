class Ability
  include CanCan::Ability

  def initialize(user)
    # ||= assigns a user to new user if its value is nil.
    user ||= User.new
    if user.admin?
      # :manage Perform CRUD operations
      can :manage, :all
    else
      can :read, :all
      can :create, Post, author_id: user.id
      can :create, Comment, user_id: user.id
      can :create, Like
      can :destroy, Post do |post|
        post.author_id == user.id
      end
      can :destroy, Comment do |comment|
        comment.user_id == user.id
      end
    end
  end
end
