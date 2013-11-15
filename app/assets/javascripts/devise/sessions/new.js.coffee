$ ->
  $('#new_user').validate
    rules:
      'user[login]':
        required: true
      'user[password]':
        required: true
