if $('.small-post').length
  new_posts = $.parseHTML "<%= j render partial: 'posts/small_post', collection: @posts %>"
else
  new_posts = $.parseHTML "<%= j render partial: 'posts/medium_post', collection: @posts %>"

$('#masonry-container').append new_posts

$(new_posts).css('opacity', '0')

$('#masonry-container').imagesLoaded ->
  $('#masonry-container').masonry 'reload'
  $(new_posts).animate
    opacity: 1
  bind_hover()


<% if @posts.next_page %>

$('.pagination').replaceWith("<%= j paginate(@posts, theme: 'twitter-bootstrap-3')%>")
$('#load-more').animate
  opacity: 0

<% else %>

$('.pagination').remove()

$('#load-more').animate
  opacity: 0
, ->
  $('#load-more').html("<i class='fa fa-eye'></i><strong>&nbsp;Now you've seen it all !</strong>")
  $(window).unbind 'scroll'

  endHint = ->
    if $(window).scrollTop() > $(document).height() - $(window).height() - 50
      if $('#load-more').css('opacity') == '0'
        $(window).off 'scroll', endHint
        $('#load-more').animate
          opacity: 1
        , ->
          $(window).on 'scroll', endHint
    else
      console.log $('#load-more').css('opacity')
      if $('#load-more').css('opacity') != '0'
        $(window).off 'scroll', endHint
        $('#load-more').animate
          opacity: 0
        , ->
          $(window).on 'scroll', endHint

  $(window).on 'scroll', endHint

<% end %>


