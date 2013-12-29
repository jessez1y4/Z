$ ->
  if $('#sign-up-form').length
    sign_up_validator = $('#sign-up-form').validate
      onkeyup: false
      onfocusout: (element) ->
        if $.trim($(element).val()).length # skip validation if field is empty
          $(element).valid()

      rules:
        'user[email]':
          required: true
          email: true
          remote: 'sign_up/email_check'
        'user[username]':
          required: true
          regex:  /^\w*$/
          minlength: 4
          maxlength: 15
          remote: 'sign_up/username_check'
        'user[full_name]':
          required: true
        'user[password]':
          required: true
          minlength: 8
          maxlength: 128
        'user[password_confirmation]':
          required: true
          equalTo: '#sign-up-form #user_password'

      messages:
        'user[email]':
          remote: "has already been registered :("
        'user[username]':
          regex: 'only accepts letters, numbers, and underscore.'
          remote: "has already been taken :("

    errors = {}
    $('#sign-up-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    sign_up_validator.showErrors errors
