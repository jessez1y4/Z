# if modal exists, dont send request
$ ->
  $('#upload-post-btn').click ->
    $('#upload-post-modal').modal()
