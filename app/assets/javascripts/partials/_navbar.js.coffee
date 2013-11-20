$ ->
  $('#upload-post-btn').click ->
    $('.cloudinary-fileupload').click()

  $('.cloudinary-fileupload').bind 'fileuploadstart', ->
    $('#add-post-dropdown').hide()
    opts =
      lines: 8 # The number of lines to draw
      length: 2 # The length of each line
      width: 2 # The line thickness
      radius: 5 # The radius of the inner circle
      corners: 1 # Corner roundness (0..1)
      rotate: 0 # The rotation offset
      direction: 1 # 1: clockwise, -1: counterclockwise
      color: '#fff' # #rgb or #rrggbb or array of colors
      speed: 1 # Rounds per second
      trail: 80 # Afterglow percentage
      shadow: false # Whether to render a shadow
      hwaccel: false # Whether to use hardware acceleration
      className: 'spinner' # The CSS class to assign to the spinner
      zIndex: 2e9 # The z-index (defaults to 2000000000)
      top: '0' # Top position relative to parent in px
      left: '0' # Left position relative to parent in px
    spinner = new Spinner(opts).spin $('#upload-spin')[0]
    $('#uploading-hint').removeClass 'hide'

  $('.cloudinary-fileupload').bind 'cloudinarydone', (e,data) ->
    # sometimes the hidden field is not added in Safari
    if !$('#post_cloudinary_data').length
      value = 'image/upload/' + data.result.path + '#' + data.result.signature
      $('#upload-post-submit').before('<input id="post_cloudinary_data" name="post[cloudinary_data]" type="hidden" value="' + value + '" />')

    $('#upload-post-submit').click()
