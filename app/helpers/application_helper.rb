module ApplicationHelper
  def conditional_header
    user_signed_in? ? 'partials/navbar' : 'partials/navbar_public'
  end

  def field_err(resource, field)
    if resource.errors[field].any?
      "#{resource.errors[field].join(', ')}."
    else
      ''
    end
  end
end
