$ ->
  if $('body.users-edit').length
    $('#edit-user-form .cloudinary-fileupload').bind 'fileuploadfail', ->
      showNotification 'Something went wrong. Try again.'
