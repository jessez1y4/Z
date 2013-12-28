$("#follow-btn").html "<%= escape_javascript(render('users/follow', user: @user)) %>"
$("#followers").html 'followed by <%= @user.followers.count %>'
