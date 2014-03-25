$ ->
  if $('#new-post-form').length
    # initialization
    container = $('#post-img-container')
    image = $('img', container)[0];
    count = $('.nested-fields').length
    form = label = null

    add_item_label = (num, x, y) ->
      span = $(document.createElement('span'))
               .attr('id', "item-label-#{num}")
               .data('target-num', num)
               .addClass('item-label')
               .addClass('item-label-no-anim')
               .text(num)
               .css('left', x + 'px')
               .css('top', y + 'px')
               .css('position', 'absolute')
               .css('cursor', 'move')
               .hover ->
                 $('.item-form').addClass 'hidden'
                 form_num = $(this).data('target-num')
                 $("#item-form-#{form_num}").removeClass 'hidden'
               .draggable
                 containment: image
                 drag: (event, ui) ->
                   form.css('left', ui.position.left - 480 + 'px')
                       .css('top', ui.position.top + 25 + 'px')
                 start: ->
                   form = $("#item-form-#{$(this).data('target-num')}")
                   form.css 'opacity', 0.8
                 stop: ->
                   form.css 'opacity', 1

      container.append span

    # set form attributes
    set_item_form = (form, num) ->
      label = $("#item-label-#{num}")

      $(form).css('left', label.position().left - 480 + 'px')
             .css('top', label.position().top + 25 + 'px')
             .data('target-num', num)
             .attr('id', "item-form-#{num}")
             .draggable
               containment: [$(image).offset().left - 14,
                             $(image).offset().top + 26,
                             $(image).offset().left + 366,
                             $(image).offset().top + 540]
               opacity: 0.8
               drag: (event, ui) ->
                 label.css('left', ui.position.left + 480 + 'px')
                    .css('top', ui.position.top - 25 + 'px')
               start: ->
                 label = $("#item-label-#{$(this).data('target-num')}")
                           .addClass 'item-label-hover'
               stop: ->
                 label.removeClass 'item-label-hover'

      $('.hide-item-form-btn', form).click ->
        $(form).addClass('hidden')

    reorder_labels = ->
      $('.item-label').each (index) ->
        $(this).text(index + 1)
               .data('target-num', index + 1)
               .attr 'id', "item-label-#{index + 1}"

    reorder_forms = ->
      $('.nested-fields').each (index) ->
        $(this).data('target-num', index + 1)
               .attr 'id', "item-form-#{index + 1}"


    $('.nested-fields').each (index) ->
      add_item_label $('.item-num', this).val(),
                     $('.item-x', this).val(),
                     $('.item-y', this).val()

      set_item_form this, index + 1
      $(this).addClass 'hidden'

    reorder_forms()

    $('body').mousedown (event) ->

      if event.target == image
        event.preventDefault()
        if $('.nested-fields.hidden').length == count
          count++

          x = event.pageX - container.offset().left - 10
          x = 0 if x < 0
          y = event.pageY - container.offset().top - 10
          y = 0 if y < 0
          add_item_label count, x, y

          $('#add-item-btn').click()
        else
          $('.item-form').addClass 'hidden'
      else
        $('.item-form').addClass 'hidden' if !$(event.target).is('.nested-fields *, .nested-fields')



    $('#item-forms')
      .on('cocoon:after-insert', (e, item) ->
        set_item_form item, count
        $('input:text:visible:first', item).focus()
      )
      .on('cocoon:before-remove', (e, item) ->
        count--
        index = $('.nested-fields').index(item)
        $('.item-label')[index].remove()
      )
      .on('cocoon:after-remove', (e, item) ->
        $(item).removeClass('nested-fields')
               .addClass('removed-nested-fields')
               .removeAttr 'id'
        $('input, select', item).addClass 'ignore'
        reorder_labels()
        reorder_forms()
      )


    # form validation
    new_post_validator = $('#new-post-form').validate
      ignore: '.ignore'
      rules:
        'post[title]':
          required: true

      submitHandler: (form) ->
        $('.nested-fields').each (index) ->
          $('.item-num', this).val(index + 1)
          label = $('.item-label')[index]
          $('.item-x', this).val $(label).css('left').replace('px', '')
          $('.item-y', this).val $(label).css('top').replace('px', '')

        form.submit()

      invalidHandler: (event, validator) ->
        $.each validator.errorList, (index, value) ->
          $(value.element).closest('.nested-fields').removeClass 'hidden'

    errors = {}
    $('#new-post-form input').each (i, e) ->
      if $(e).data('error')
        errors[$(e).attr('name')] = $(e).data('error')

    new_post_validator.showErrors errors


    # tag autocomplete
    $('#tag-list-input').autocomplete
      source: (request, response) ->
        term = $.trim request.term.substring(request.term.lastIndexOf(',') + 1)
        if term == '' or term.length < 2
          response []
        else
          $.getJSON '/tag_suggestions', { term: term }, response
      delay: 250
      messages:
        noResults: ''
        results: ->
      select: (event, ui) ->
        event.preventDefault()
        tags = $('#tag-list-input').val()
        index = tags.lastIndexOf(',')
        if index == -1
          new_tags = "#{ui.item.value}, "
        else
          new_tags = "#{tags.substring(0, index)}, #{ui.item.value}, "
        $('#tag-list-input').val new_tags
