$("#follow-btn").html "<%= escape_javascript(render('users/unfollow', user: @user)) %>"
$("#followers").html '<%= @user.followers.count %>'

$('#unfollow-btn').hover ->
    $(this).val('Unfollow')
  , ->
    $(this).val('Followed')
