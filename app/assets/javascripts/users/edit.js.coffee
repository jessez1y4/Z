$ ->
  if $('body.users-edit').length
    edit_user_cl = $('#edit-avatar-form .cloudinary-fileupload')

    $('#upload-avatar-btn').click ->
      edit_user_cl.click()

    edit_user_cl.bind 'fileuploadstart', ->
      $('#upload-avatar-btn').text('Uploading...').prop('disabled', true)

    edit_user_cl.bind 'fileuploadfail', ->
      showNotification 'Something went wrong. Try again.'
      $('#upload-avatar-btn').text('Upload from local').prop('disabled', false)

    edit_user_cl.bind 'cloudinarydone', (e, data) ->
      if data.result.width < 100 or data.result.height < 100
        showNotification 'Your photo is too small :('
        $('#upload-avatar-btn').text('Upload from local').prop('disabled', false)
      else
        new_src = data.result.url.replace '/upload/', '/upload/c_fill,g_face,h_100,w_100/'
        $('#avatar-edit img').attr 'src', new_src
        $('#step-1').hide()
        $('#step-2').removeClass 'hide'

    $('#save-avatar-btn').click ->
      $('#edit-avatar-form').submit()





