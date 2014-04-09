$(".follow-btn-<%= @user.id %>").html "<%= escape_javascript(render('users/unfollow', user: @user)) %>"

$(".followers-count").html "<%= @user.followers_count %>"

# $('#unfollow-btn').hover ->
#     $(this).val('Unfollow')
#   , ->
#     $(this).val('Followed')
