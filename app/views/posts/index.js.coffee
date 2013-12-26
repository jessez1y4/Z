$('#posts').append "<%= j render(@posts) %>"

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
          opacity: 0.8
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


