$ ->
  if $('#new-channel-form').length
    new_channel_validator = $('#new-channel-form').validate
      rules:
        'channel[name]':
          required: true

    errors = {}
    $('#new-channel-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    new_channel_validator.showErrors errors
