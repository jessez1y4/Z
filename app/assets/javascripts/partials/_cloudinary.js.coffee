$ ->
  # show cl err
  url = window.location.href
  err_i = url.indexOf('cl_err=')

  if err_i > -1
    switch url.charAt(err_i + 7)
      when '1'
        msg = 'Your photo is too small :('
      when '2'
        msg = 'Something went wrong. Try again.'

    showNotification msg


  # settings
  $('.cloudinary-fileupload').attr('accept', 'image/*')

  post_cl = $('#hidden-post-form .cloudinary-fileupload')

  reload_with_err = (err) ->
    url = window.location.href;
    param = "cl_err=#{err}";

    if url.indexOf('cl_err') > -1
      url = url.replace /cl_err=./, param
    else
      if url.indexOf('?') > -1
        url += "&#{param}"
      else
        url += "?#{param}"

    window.location.href = url;

  $('#choose-post-photo-btn').click ->
    post_cl.click()

  # cloudinary events
  post_cl.bind 'fileuploadstart', ->
    $('#choose-post-photo-btn').text('Uploading...').prop('disabled', true)

  post_cl.bind 'fileuploadfail', ->
    reload_with_err(2)


  post_cl.bind 'cloudinarydone', (e,data) ->
    # check image size
    if data.result.width < 640 or data.result.height < 640
      reload_with_err(1)

    else
      $('#orig_width').val data.result.width
      $('#orig_height').val data.result.height
      $('#hidden-post-form').submit()

  # web link validator
  window.from_web_post_validator = $('#from-web-post-form').validate
    rules:
      'web_link':
        required: true
        cus_url: true

    messages:
      'web_link':
        required: "It's empty :("
        cus_url: 'The link looks invalid..'

    submitHandler: (form) ->
      $('input:submit', form).val('Fetching...').prop('disabled', true)
      post_cl.cloudinary_upload_url($('#web-link').val())
