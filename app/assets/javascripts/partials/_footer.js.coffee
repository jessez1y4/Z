$ ->
  $(window).scroll ->
    if $(this).scrollTop() > 200
      $('#go-top-btn').fadeIn(200)
    else
      $('#go-top-btn').fadeOut(200)

  $('#go-top-btn').click (event) ->
    event.preventDefault()
    $('html, body').animate {scrollTop: 0}, 350
