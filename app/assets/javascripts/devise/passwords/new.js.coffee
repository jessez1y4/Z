$ ->
  if $('#forgot-password-form').length
    forgot_password_validator = $('#forgot-password-form').validate
      rules:
        'user[email]':
          required: true
          email: true

    if $('#forgot-password-form #user_email').data('error')
      forgot_password_validator.showErrors
        'user[email]': $('#forgot-password-form #user_email').data('error')
