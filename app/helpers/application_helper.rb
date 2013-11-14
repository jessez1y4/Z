module ApplicationHelper
  def conditional_header
    user_signed_in? ? 'partials/nav_bar' : 'partials/nav_bar_public'
  end
end
