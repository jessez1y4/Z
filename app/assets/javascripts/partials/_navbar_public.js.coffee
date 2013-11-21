$ ->
  sign_in_validator = $('#sign-in-form').validate
    onkeyup: false

    rules:
      'user[login]':
        required: true
      'user[password]':
        required: true

  $('#sign-in-modal').on 'hidden.bs.modal', ->
    $('input:text, input:password', this).val('')
    sign_in_validator.resetForm()
