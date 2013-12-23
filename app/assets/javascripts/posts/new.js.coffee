$ ->
  count = 0

  container = $('#post-img-container')
  image = $('img', container)[0];

  container.mousedown (event) ->
    if event.target == image
      event.preventDefault()
      count++
      element = $(document.createElement('span'))
                  .addClass('item-label')
                  .text(count)
                  .css('left', event.pageX - container.offset().left - 12 + 'px')
                  .css('top', event.pageY - container.offset().top - 12 + 'px')
                  .css('position', 'absolute')
                  .draggable
                    containment: image
      container.append(element)

      $('#add-item-btn').click()

  $('#item-forms')
    .on('cocoon:after-insert', (e, item) ->
      item.find('.item-form-title').text("Item #{count}")
      $('input:text:visible:first', item).focus()
    )
    .on('cocoon:before-remove', (e, item) ->
      count--
      index = $('.nested-fields').index(item)
      $('.item-label')[index].remove()
    )
    .on('cocoon:after-remove', (e, item) ->
      $('.item-label').each (index) ->
        $(this).text(index + 1)
      $('.item-form-title').each (index) ->
        $(this).text("Item #{index + 1}")
    )

  new_post_validator = $('#new-post-form').validate
    submitHandler: (form) ->
      $('.nested-fields').each (index) ->
        $('.item-num', this).val(index + 1)
        label = $('.item-label')[index]
        $('.item-x', this).val $(label).css('left').replace('px', '')
        $('.item-y', this).val $(label).css('top').replace('px', '')

      form.submit()
