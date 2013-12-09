$ ->
  if $('#change-password-form').length
    change_password_validator = $('#change-password-form').validate
      rules:
        'user[password]':
          required: true
          minlength: 8
          maxlength: 128
        'user[password_confirmation]':
          required: true
          equalTo: '#change-password-form #user_password'

    errors = {}
    $('#change-password-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    change_password_validator.showErrors errors
