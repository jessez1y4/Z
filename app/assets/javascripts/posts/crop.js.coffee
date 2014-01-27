$ ->
  if $('body.posts-crop').length
    target_width = 390
    target_height = 520

    orig_width = $('#crop-container').data('orig-width')
    orig_height = $('#crop-container').data('orig-height')

    current_height = 464
    current_width = Math.ceil(current_height * orig_width / orig_height)

    ratio = current_width / orig_width

    min_width = target_width * ratio
    min_height = target_height * ratio

    ini_width = 330
    ini_height = 464

    ini_x = (current_width - ini_width) / 2
    ini_y = (current_height - current_width * 4 / 3) / 2

    $('#crop-container').css 'width', current_width + 2
    $('.panel').css 'width', current_width + 74
    $('.panel').css 'margin-left', (930 - current_width - 74) / 2

    set_hidden_fields = (c) ->
      $('#crop_x').val Math.round(c.x / ratio)
      $('#crop_y').val Math.round(c.y / ratio)
      $('#crop_w').val Math.round(c.w / ratio)
      $('#crop_h').val Math.round(c.h / ratio)

    $('#crop-img').Jcrop
      bgOpacity: .35
      aspectRatio: 3/4
      minSize: [min_width, min_height]
      setSelect: [ini_x, ini_y, ini_width, ini_height]
      onSelect: set_hidden_fields
