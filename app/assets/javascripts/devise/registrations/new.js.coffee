$ ->
  if $('#sign-up-form').length
    sign_up_validator = $('#sign-up-form').validate
      rules:
        'user[email]':
          required: true
          email: true
          # remote: 'sign_up/email_check'
        'user[full_name]':
          required: true
        'user[password]':
          required: true
          minlength: 8
          maxlength: 128

      # messages:
      #   'user[email]':
      #     remote: "has already been registered :("

    errors = {}
    $('#sign-up-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    sign_up_validator.showErrors errors
