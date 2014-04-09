$(".follow-btn-<%= @user.id %>").html "<%= escape_javascript(render('users/follow', user: @user)) %>"

$(".followers-count").html "<%= @user.followers_count %>"
