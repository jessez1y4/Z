$ ->
  window.sign_in_validator = $('#sign-in-form').validate
    onkeyup: false

    rules:
      'user[login]':
        required: true
      'user[password]':
        required: true

  $('#nav-search-box').keyup ->
    if $.trim($(this).val()) == ''
      $('#nav-search-btn').addClass 'hidden'
      $('#nav-search-group').removeClass 'input-group'
    else
      $('#nav-search-btn').removeClass 'hidden'
      $('#nav-search-group').addClass 'input-group'

