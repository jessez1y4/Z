$ ->
  $('.cloudinary-fileupload').attr('accept', 'image/*')

  $('#choose-post-photo-btn').click ->
    $('#hidden-post-form .cloudinary-fileupload').click()

  $('#hidden-post-form .cloudinary-fileupload').bind 'fileuploadstart', ->
    $('#choose-post-photo-btn').text('Uploading...').prop('disabled', true)

  $('#hidden-post-form .cloudinary-fileupload').bind 'fileuploadfail', ->
    showNotification 'Something went wrong. Try again.'
    $('#choose-post-photo-btn').text('Choose a photo').prop('disabled', false)
    $('#from-web-post-form input:submit').val('Fetch image').prop('disabled', false)

  $('#hidden-post-form .cloudinary-fileupload').bind 'cloudinarydone', (e,data) ->
    # check image size
    if data.result.width < 640 or data.result.height < 640
      showNotification 'Your photo is too small :('
      $('#choose-post-photo-btn').text('Choose a photo').prop('disabled', false)
      $('#from-web-post-form input:submit').val('Fetch image').prop('disabled', false)
    else
      $('#upload-post-submit').click()


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
      $('#hidden-post-form .cloudinary-fileupload').cloudinary_upload_url($('#web-link').val())
