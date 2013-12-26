$("#like-btn-<%= @post.id %>").html "<%= escape_javascript(render('posts/unlike', post: @post)) %>"
