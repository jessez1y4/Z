$ ->
  $('#notification').click ->
    $(this).animate
      opacity: 0
      top: '2px'
    , ->
      $(this).hide()

  msg = $('#notification').data('alert') or $('#notification').data('notice')
  showNotification msg if msg


window.showNotification = (msg, time) ->
  time = time || 2500

  $('#notification').html(msg)

  $('#notification')
    .show()
    .animate
      opacity: 1
      top: '16px'
    , 'slow', ->
      setTimeout ->
        $('#notification').animate(
          opacity: 0
          top: '2px'
        , ->
          $(this).hide())
      , time
