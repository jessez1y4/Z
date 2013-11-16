$ ->
  if $('body.sessions-new').length
    $('#new_user').validate
      onkeyup: false

      rules:
        'user[login]':
          required: true
        'user[password]':
          required: true
