$("#follow-btn").html "<%= escape_javascript(render('users/unfollow', user: @user)) %>"

$('#unfollow-btn').hover ->
    $(this).val('Unfollow')
  , ->
    $(this).val('Followed')
