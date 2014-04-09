$ ->
  if $('body.users-edit, body.users-update').length
    active_tab = $('.tab-content').data('tab') || '#avatar-edit'
    $("#{active_tab}").addClass 'active'
    $("#{active_tab}-tab").addClass 'active'

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
        $('#avatar-edit').imagesLoaded ->
          $('#step-1').hide()
          $('#step-2').removeClass 'hidden'

    $('#save-avatar-btn').click ->
      $('#edit-avatar-form').submit()


    edit_profile_validator = $('#edit-profile-form').validate
      rules:
        'user[username]':
          required: true
          minlength: 4
          maxlength: 30
          regex: /^[a-zA-Z0-9_]+$/
        'user[email]':
          required: true
          email: true
        'user[full_name]':
          required: true
      messages:
        'user[username]':
          regex: 'only accepts letters, numbers and underscore.'

    errors = {}
    $('#edit-profile-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    edit_profile_validator.showErrors errors

    # sign in auth
    sign_in_checkbox_handler = (e, provider) ->
      if $(e).is(':checked')
        window.location.href = '/users/auth/' + provider
      else
        $.ajax
          url: '/sign_in_authentications/' + $(e).data('id')
          type: 'DELETE'


    $('#fb-login-check').click ->
      sign_in_checkbox_handler(this, 'facebook')
    $('#gg-login-check').click ->
      sign_in_checkbox_handler(this, 'google')

