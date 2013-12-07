$ ->
  $('#notification').click ->
    $(this).animate
      opacity: 0
      top: '5px'
    , ->
      $(this).hide()

window.showNotification = (msg) ->
  $('#notification').html(msg)

  $('#notification')
    .show()
    .animate
      opacity: 1
      top: '20px'
    , 'slow', ->
      setTimeout ->
        $('#notification').animate(
          opacity: 0
          top: '5px'
        , ->
          $(this).hide())
      , 2500
