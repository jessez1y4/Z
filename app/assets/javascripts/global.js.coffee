# add regex validation to jquery validation plugin
$.validator.addMethod 'regex', ((value, element, regexp) ->
  @optional(element) or $.trim(value).match(regexp)
), 'Please check your input.'

# auto focus the first visible text input on modal when it shows
$ ->
  $('.modal-trigger').click (e) ->
    selector = "##{$(this).data('modal-name')}-modal"
    $(selector).modal()
    e.preventDefault()

  $('.modal').on 'shown.bs.modal', ->
    $('input:text:visible:first', this).focus()

  $('.modal').on 'hidden.bs.modal', ->
    $('input[type=text], input[type=password], input[type=email]', this).val('')
    validator = $(this).attr('id').replace(/-/g, '_').replace('modal', 'validator')
    eval("#{validator}.resetForm();")
