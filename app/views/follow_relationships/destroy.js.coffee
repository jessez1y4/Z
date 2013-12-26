$("#follow-btn").html "<%= escape_javascript(render('users/follow')) %>"
$("#followers").html 'followed by <%= @user.followers.count %>'
