$ ->
  $('#choose-post-photo-btn').click ->
    $('.cloudinary-fileupload').click()

  $('.cloudinary-fileupload').bind 'fileuploadstart', ->
    $('#upload-post-modal .modal-body').html "<h4 class='uploading-text'>Uploading to cloud..</h4>"

  $('.cloudinary-fileupload').bind 'cloudinarydone', (e,data) ->
    # sometimes the hidden field is not added in Safari
    if !$('#post_cloudinary_data').length
      value = 'image/upload/' + data.result.path + '#' + data.result.signature
      $('#upload-post-submit').before('<input id="post_cloudinary_data" name="post[cloudinary_data]" type="hidden" value="' + value + '" />')

    $('#upload-post-submit').click()


  $('#from-web-post-form').validate
    rules:
      'web_link':
        required: true

    messages:
      'web_link':
        required: "It's empty :("
