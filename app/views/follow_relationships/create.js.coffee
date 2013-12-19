$("#follow-btn").html "<%= escape_javascript(render('users/unfollow')) %>"
$("#followers").html 'followed by <%= @user.followers.count %>'
