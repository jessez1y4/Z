module UserHelper
  def follow_button(user)
    unless user == current_user
      if FollowRelationship.where(follower_id: current_user, followed_id: user).empty?
        render 'users/follow'
      else
        render 'users/unfollow'
      end
    end
  end
end
