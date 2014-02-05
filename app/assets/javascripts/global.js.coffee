# add regex validation to jquery validation plugin
$.validator.addMethod 'regex', ((value, element, regexp) ->
  @optional(element) or $.trim(value).match(regexp)
), 'Please check your input.'

# custom url validation
$.validator.addMethod 'cus_url', ((value, element) ->
  @optional(element) or /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/.test(value);
), 'is not a valid URL.'


# change default err msgs for form validation plugin
$.extend $.validator.messages,
  required: "can't be blank."
  remote: 'Please fix this field.'
  email: 'is not a valid email.'
  url: 'is not a valid URL.'
  date: 'is not a valid date.'
  dateISO: 'is not a valid date (ISO).'
  number: 'is not a valid number.'
  digits: 'only allows digits.'
  creditcard: 'is not a valid credit card number.'
  equalTo: 'Please enter the same value again.'
  accept: 'Please enter a value with a valid extension.'
  maxlength: $.validator.format('should be no more than {0} characters.')
  minlength: $.validator.format('should be at least {0} characters.')
  rangelength: $.validator.format('should be between {0} and {1} characters long.')
  range: $.validator.format('should be between {0} and {1}.')
  max: $.validator.format('should be less than or equal to {0}.')
  min: $.validator.format('should be greater than or equal to {0}.')

# auto focus the first visible text input on modal when it shows
$ ->
  $('.modal').on 'shown.bs.modal', ->
    $('input:text:visible:first', this).focus()

  $('.modal').on 'hidden.bs.modal', ->
    $('input[type=text], input[type=password], input[type=email]', this).val('')
    validator = $(this).attr('id').replace(/-/g, '_').replace('modal', 'validator')
    eval("#{validator}.resetForm();")

  $('.atooltip').aToolTip()
