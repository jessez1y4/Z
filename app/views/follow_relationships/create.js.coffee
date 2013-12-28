$("#follow-btn").html "<%= escape_javascript(render('users/unfollow', user: @user)) %>"
$("#followers").html 'followed by <%= @user.followers.count %>'
