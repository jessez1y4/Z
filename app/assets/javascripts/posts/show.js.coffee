$ ->
  if $('body.posts-show').length
    # comment button
    $('#post-comment-input').focus ->
      $('#post-comment-btn').removeClass 'hidden'

    # focus comment if parameter says so
    if window.location.href.indexOf('comment=') > -1
      $('#post-comment-input').focus()

    container = $('#show-post-img-container')

    $('.item-info').each (index) ->
      container.append $(document.createElement('span'))
                        .addClass('item-label')
                        .text($(this).data('number'))
                        .attr('id', $(this).data('target'))
                        .attr('data-target', @id)
                        .css('left', $(this).data('x') + 'px')
                        .css('top', $(this).data('y') + 'px')
                        .css('position', 'absolute')


      target = $("##{$(this).data('target')}")
      $(this).hover \
        ->
          target.css('opacity', 0.9)
          $('.item-number', this).addClass('item-number-hovered')
        ,
        ->
          target.css('opacity', 0)
          $('.item-number', this).removeClass('item-number-hovered')

    if $('#hidden-like-form').length
      $('.post-likes-click').click ->
        $('#hidden-like-form').submit()

    container.hover \
      -> $('.item-label').css('opacity', 0.9)
      ,
      -> $('.item-label').css('opacity', 0)

    $('.item-label').hover \
      ->
        target_id = this.id.replace 'label', 'number'
        $("##{target_id}").addClass('item-number-hovered')
      ,
      ->
        target_id = this.id.replace 'label', 'number'
        $("##{target_id}").removeClass('item-number-hovered')

    # item name width
    $('#post-items .item-info > p').each ->
      width = $(this).width() - $('.small', this).width() - 32
      $('.item-name', this).css 'max-width', "#{width}px"

    # hotkeys
    $(document.body).keydown (event) ->
      return if $('#post-comment-input').is(':focus')

      keyCode = event.which || event.keyCode

      switch (keyCode)
        when 37
          $('#prev-post-link')[0].click()
        when 39
          $('#next-post-link')[0].click()
        when 76
          $('#like-submit')[0].click()

    $(document.body).keyup (event) ->
      return if $('#post-comment-input, #nav-search-box').is(':focus')

      keyCode = event.which || event.keyCode

      switch (keyCode)
        when 67
          $('#post-comment-input').focus()

    # post info height
    if (diff = $('#post-info').outerHeight() - 536) > 0
      $('#post-tags').css 'border-bottom', 'none'
      if diff > 47
        next_section = if $('#similar-posts').length
          $('#similar-posts')
        else
          $('#post-comments')
        next_section.css 'margin-top', "#{diff - 27}px"

    # share buttons
    $('#share-facebook').sharrre
      share:
        facebook: true
      template: '<div class="icons-share-facebook"></div>'
      enableHover: false
      render: (api, options) ->
        $(api.element).on 'click', '.icons-share-facebook', ->
          api.openPopup('facebook')

    $('#share-google').sharrre
      share:
        googlePlus: true
      template: '<div class="icons-share-google"></div>'
      enableHover: false
      urlCurl: ''
      click: (api, options) ->
        api.simulateClick()
        api.openPopup('googlePlus')
      buttons:
        google:
          annotation: $('#share-google').data('text')

    $('#share-twitter').sharrre
      share:
        twitter: true
      template: '<div class="icons-share-twitter"></div>'
      enableHover: false
      urlCurl: ''
      click: (api, options) ->
        api.simulateClick()
        api.openPopup('twitter')

    $('#share-pinterest').sharrre
      share:
        pinterest: true
      template: '<div class="icons-share-pinterest"></div>'
      enableHover: false
      click: (api, options) ->
        api.simulateClick()
        api.openPopup('pinterest')
      buttons:
        pinterest:
          media: $('#show-post-img-container img').attr 'src'
          description: $('#share-pinterest').data('text')
