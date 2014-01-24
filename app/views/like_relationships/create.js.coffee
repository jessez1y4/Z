if $('.masonry-brick').length
  $("#like-btn-<%= @post.id %>").html "<%=j render('posts/masonry_unlike', post: @post) %>"
  $("#masonry-title-likes-<%= @post.id %>").html "<%=j fa_icon 'heart-o', text: @post.like_relationships_count %>"
else
  $("#like-btn-<%= @post.id %>").html "<%=j render('posts/unlike', post: @post) %>"
