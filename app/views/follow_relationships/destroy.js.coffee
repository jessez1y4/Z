$("#follow-btn").html "<%= escape_javascript(render('users/follow', user: @user)) %>"
$("#followers").html '<%= @user.followers.count %>'
