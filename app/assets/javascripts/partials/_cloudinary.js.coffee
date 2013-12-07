$ ->
  $('#choose-post-photo-btn').click ->
    $('.cloudinary-fileupload').click()

  $('.cloudinary-fileupload').bind 'fileuploadstart', ->
    $('#choose-post-photo-btn').text('Uploading...').prop('disabled', true)

  $('.cloudinary-fileupload').bind 'cloudinarydone', (e,data) ->
    # check image size
    if data.result.width < 640 or data.result.height < 640
      showNotification 'Your photo is too small :('
      $('#choose-post-photo-btn').text('Choose a photo').prop('disabled', false)
    else
      # sometimes the hidden field is not added in Safari
      if !$('#post_cloudinary_data').length
        value = "image/upload/#{data.result.path}##{data.result.signature}"
        $('#upload-post-submit').before("<input id='post_cloudinary_data' name='post[cloudinary_data]'' type='hidden' value='#{value}' />")

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
      form.submit()
