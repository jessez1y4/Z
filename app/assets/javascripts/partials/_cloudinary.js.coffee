$ ->
  $('.cloudinary-fileupload').attr('accept', 'image/*')

  post_cl = $('#hidden-post-form .cloudinary-fileupload')

  $('#choose-post-photo-btn').click ->
    post_cl.click()

  post_cl.bind 'fileuploadstart', ->
    $('#choose-post-photo-btn').text('Uploading...').prop('disabled', true)

  post_cl.bind 'fileuploadfail', ->
    showNotification 'Something went wrong. Try again.'
    $('#choose-post-photo-btn').text('Choose a photo').prop('disabled', false)
    $('#from-web-post-form input:submit').val('Fetch image').prop('disabled', false)

  post_cl.bind 'cloudinarydone', (e,data) ->
    # check image size
    if data.result.width < 640 or data.result.height < 640
      showNotification 'Your photo is too small :('
      $('#choose-post-photo-btn').text('Choose a photo').prop('disabled', false)
      $('#from-web-post-form input:submit').val('Fetch image').prop('disabled', false)
    else
      $('#orig_width').val data.result.width
      $('#orig_height').val data.result.height
      $('#hidden-post-form').submit()


  window.from_web_post_validator = $('#from-web-post-form').validate
    rules:
      'web_link':
        required: true
        url: true

    messages:
      'web_link':
        required: "It's empty :("
        url: 'The link looks invalid..'

    submitHandler: (form) ->
      $('input:submit', form).val('Fetching...').prop('disabled', true)
      post_cl.cloudinary_upload_url($('#web-link').val())
