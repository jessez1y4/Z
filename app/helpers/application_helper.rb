module ApplicationHelper
  def conditional_header
    user_signed_in? ? 'partials/navbar' : 'partials/navbar_public'
  end
end
