$("#like-btn-<%= @post.id %>").html "<%= escape_javascript(render('posts/like', post: @post)) %>"
