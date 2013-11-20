# add regex validation to jquery validation plugin
$.validator.addMethod 'regex', ((value, element, regexp) ->
  @optional(element) or value.match(regexp)
), 'Please check your input.'
