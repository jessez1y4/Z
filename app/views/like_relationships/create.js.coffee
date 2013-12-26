$("#like-btn").html "<%= escape_javascript(render('posts/unlike', post: @post)) %>"
