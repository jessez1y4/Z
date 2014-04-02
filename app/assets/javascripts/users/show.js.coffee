$ ->
  if $('body.users-show').length
    # new message form validation
    window.new_message_validator = $('#new-message-form').validate
      rules:
        'title':
          required: true
          maxlength: 50
        'body':
          required: true
