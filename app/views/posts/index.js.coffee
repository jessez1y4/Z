new_posts = $.parseHTML "<%= j render @posts %>"

$('#masonry-container').append new_posts

$(new_posts).css('opacity', 0)

$('#masonry-container').imagesLoaded ->
  $('#masonry-container').masonry 'reload'
  $(new_posts).animate
    opacity: 1

<% if @posts.next_page %>

$('.pagination').replaceWith("<%= j paginate(@posts)%>")
$('#load-more').css('opacity', 0)

<% else %>

$('.pagination').remove()

$('#load-more').html("The End")

<% end %>


