$ ->
  $(window).scroll ->
    if $(this).scrollTop() > 200
      $('#go-top-btn').css 'opacity', 1
    else
      $('#go-top-btn').css 'opacity', 0

  $('#go-top-btn').click (event) ->
    event.preventDefault()
    $('html, body').animate {scrollTop: 0}, 350
