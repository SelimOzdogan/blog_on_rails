class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all 
      end

    can(:update, Post) do |post|#edit
        # byebug
      post.user == user
    end

    can(:destroy, Post) do |post|#delete
        post.user == user
      end

    can(:destroy, Comment) do |comment|#delete
        comment.user == user || comment.post.user == user
      end

    can(:update, User) do |user_edit|#edit
        user == user_edit
      end
  end
end
