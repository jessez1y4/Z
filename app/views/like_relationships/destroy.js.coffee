$("#like-btn").html "<%= escape_javascript(render('posts/like', post: @post)) %>"
