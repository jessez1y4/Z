$ ->
  window.sign_in_validator = $('#sign-in-form').validate
    onkeyup: false

    rules:
      'user[login]':
        required: true
      'user[password]':
        required: true
