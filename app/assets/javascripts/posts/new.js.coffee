$ ->
  if $('#new-post-form').length
    # initialization
    container = $('#post-img-container')
    image = $('img', container)[0];
    count = $('.nested-fields:visible').length

    add_item_label = (num, x, y) ->
      container.append $(document.createElement('span'))
                        .addClass('item-label')
                        .text(num)
                        .css('left', x + 'px')
                        .css('top', y + 'px')
                        .css('position', 'absolute')
                        .draggable
                          containment: image

    reorder_labels = ->
      $('.item-label').each (index) ->
        $(this).text(index + 1)

    reorder_forms = ->
      $('.nested-fields:visible').each (index) ->
        $('.item-form-title', this).text("Item #{index + 1}")

    $('.nested-fields:visible').each (index) ->
      add_item_label $('.item-num', this).val(),
                     $('.item-x', this).val(),
                     $('.item-y', this).val()

    reorder_forms()

    container.mousedown (event) ->
      if event.target == image
        event.preventDefault()
        count++
        add_item_label count,
                       event.pageX - container.offset().left - 10,
                       event.pageY - container.offset().top - 10

        $('#add-item-btn').click()

    $('#item-forms')
      .on('cocoon:after-insert', (e, item) ->
        item.find('.item-form-title').text("Item #{count}")
        $('input:text:visible:first', item).focus()
      )
      .on('cocoon:before-remove', (e, item) ->
        count--
        index = $('.nested-fields:visible').index(item)
        $('.item-label')[index].remove()
      )
      .on('cocoon:after-remove', (e, item) ->
        reorder_labels()
        reorder_forms()
      )

    new_post_validator = $('#new-post-form').validate
      rules:
        'post[title]':
          required: true

      submitHandler: (form) ->
        $('.nested-fields:visible').each (index) ->
          $('.item-num', this).val(index + 1)
          label = $('.item-label')[index]
          $('.item-x', this).val $(label).css('left').replace('px', '')
          $('.item-y', this).val $(label).css('top').replace('px', '')

        form.submit()
