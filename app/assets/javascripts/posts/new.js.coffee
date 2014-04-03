$ ->
  if $('#new-post-form').length
    # initialization
    container = $('#post-img-container')
    image = $('img', container)[0];
    count = $('.nested-fields').length
    form = label = null

    # function to get tag name
    isSameTag = (e, s) ->
      $.trim(e.innerText).toLowerCase() == s.toLowerCase()

    # click to remove tag
    tagClickHandler = ->
      tagName = $.trim this.innerText
      $(this).remove()

      $('#add-tags-modal .selected').each (i, selected) ->
        if isSameTag(selected, tagName)
          $(selected).removeClass('selected')
          return false

    $('#tags-edit .tag-edit').on 'click', tagClickHandler

    # click to select tag in modal
    $('.candidate-tags .tag-edit').click ->
      tagName = $.trim this.innerText

      $('#tags-edit .tag-edit').each (i, selected) ->
        if isSameTag(selected, tagName)
          $(selected).remove()
          return false

      $(this).one 'mouseout', ->
        $(this).toggleClass('selected')

    # select initial tags on tag modal
    if $('#tags-edit .type5').length
      $('#cityTag').val $.trim($('#tags-edit .type5')[0].innerText)

    if $('#tags-edit .type4').length
      $('#collegeTag').val $.trim($('#tags-edit .type4')[0].innerText)

    $('.type1, .type2, .type3', '#tags-edit').each (i, tag) ->
      tagName = $.trim tag.innerText

      $('#add-tags-modal .tag-edit').each (i, t) ->
        if isSameTag(t, tagName)
          $(t).addClass('selected')
          return false

    # when opening modal
    $('#add-tags-modal').on 'show.bs.modal', ->
      if $('#tags-edit .type5').length
        $('#city-tag').val $.trim($('#tags-edit .type5')[0].innerText)

      if $('#tags-edit .type4').length
        $('#college-tag').val $.trim($('#tags-edit .type4')[0].innerText)

      # $('#tags-edit .type0').each (i, tag) ->
      #   if $('#custom-tag').val() == ''
      #     $('#custom-tag').val $.trim(tag.innerText)
      #   else
      #     $('#custom-tag').val $('#custom-tag').val() + ', ' + $.trim(tag.innerText)

    # set tags when closing modal
    $('#add-tags-modal button').click ->
      # add tags
      $('#add-tags-modal .selected').each (i, tag) ->
        tagName = $.trim tag.innerText
        existed = false

        $('#tags-edit .tag-edit').each (i, t) ->
          if isSameTag(t, tagName)
            existed = true
            return false

        if !existed
          span = $(document.createElement('span'))
                   .addClass('tag-edit')
                   .html(tagName)
                   .on('click', tagClickHandler)
          $('#tags-edit').append span

      # add city tag
      cityTag = $.trim($('#city-tag').val())
      if cityTag != ""
        if $('#tags-edit .type5').length
          $('#tags-edit .type5').html(cityTag)
        else
          span = $(document.createElement('span'))
                   .addClass('tag-edit type5')
                   .html(cityTag)
                   .on('click', tagClickHandler)
          $('#tags-edit').append span

      # add college tag
      collegeTag = $.trim($('#college-tag').val())
      if collegeTag != ""
        if $('#tags-edit .type4').length
          $('#tags-edit .type4').html(collegeTag)
        else
          span = $(document.createElement('span'))
                   .addClass('tag-edit type4')
                   .html(collegeTag)
                   .on('click', tagClickHandler)
          $('#tags-edit').append span

      # add custom tags
      tags = $('#custom-tag').val().split(',').map (s) ->
        return s.trim()

      $.each tags, (i, s) ->
        if s != ''
          existed = false

          $('#tags-edit .tag-edit').each (i, t) ->
            if isSameTag(t, s)
              existed = true
              return false

          if !existed
            span = $(document.createElement('span'))
                     .addClass('tag-edit type0')
                     .html(s)
                     .on('click', tagClickHandler)
            $('#tags-edit').append span

      # hide modal
      $('#add-tags-modal').modal('hide')




    add_item_label = (num, x, y) ->
      span = $(document.createElement('span'))
               .attr('id', "item-label-#{num}")
               .data('target-num', num)
               .addClass('item-label')
               .css('opacity', '1')
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

      if !$("#item-number-#{num}").length
        itemInfo = "<div class='item-info'><p><span class='item-number' id='item-number-#{num}'>#{num}</span>&nbsp;<span class='item-name'>&nbsp;</span>&nbsp;&nbsp;&nbsp;<a data-target-num='#{num}' href='#'>REMOVE</a></p></div>"

        $('#items-info').append itemInfo

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

    set_item_info = (num) ->
      $("#item-form-#{num} .item-name-input").keyup ->
        targetNum = $(this).closest('.item-form').data('target-num')
        $("#item-number-#{targetNum} + .item-name").html $(this).val() + '&nbsp;'

      $("#item-number-#{num} ~ a").click (e) ->
        e.preventDefault()
        targetNum = $(this).data('target-num')
        $("#item-form-#{targetNum} .pull-right a").trigger 'click'


    reorder_labels = ->
      $('.item-number').each (index) ->
        $(this).text(index + 1)
               .attr 'id', "item-number-#{index + 1}"
        $(this).next().next().data 'target-num', index + 1

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
      set_item_info index + 1

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
        set_item_info count
        $('input:text:visible:first', item).focus()
      )
      .on('cocoon:before-remove', (e, item) ->
        count--
        index = $('.nested-fields').index(item)
        $('.item-label')[index].remove()
        $('.item-info')[index].remove()
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

        # generate tag_list
        tagList = ''
        $('#tags-edit .tag-edit').each (i, tag) ->
          tagList = tagList + ',' + $.trim(tag.innerText)
        $('#tag-list-input').val tagList.substring(1)

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
    $('#custom-tag').autocomplete
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
        tags = $('#custom-tag').val()
        index = tags.lastIndexOf(',')
        if index == -1
          new_tags = "#{ui.item.value}, "
        else
          new_tags = "#{tags.substring(0, index)}, #{ui.item.value}, "
        $('#custom-tag').val new_tags
