$ ->
  if $('body.registrations-new').length
    $('#sign-up-form').validate
      onkeyup: false
      onfocusout: (element) ->
        if $.trim($(element).val()).length # skip validation if field is empty
          $(element).valid()

      rules:
        'user[email]':
          required: true
          email: true
          remote: 'email_check'
        'user[username]':
          required: true
          regex:  /^\w*$/
          minlength: 4
          maxlength: 15
          remote: 'username_check'
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
          remote: "This email address has been registered :("
        'user[username]':
          regex: 'Username only accepts letters, numbers, and underscore.'
          remote: "This username has already been taken :("
