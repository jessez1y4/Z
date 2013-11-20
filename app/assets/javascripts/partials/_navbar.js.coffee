# if modal exists, dont send request
$ ->
  $('#upload-post-btn').click (e) ->
    $('#upload-post-modal').modal()
    e.preventDefault()

  $('#from-web-post-btn').click (e) ->
    $('#from-web-post-modal').modal()
    e.preventDefault()
