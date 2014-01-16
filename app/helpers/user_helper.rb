module UserHelper
  def follow_button(user)
    unless user == current_user
      if FollowRelationship.where(follower_id: current_user, followed_id: user).empty?
        render 'users/follow', user: user
      else
        render 'users/unfollow', user: user
      end
    end
  end

  def nicer_name(provider)
    if provider == 'google_oauth2'
      'Google'
    else
      provider.titleize
    end
  end
end
