$ ->
  if $('body.posts-show').length
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
                        .hide()

      target = $("##{$(this).data('target')}")
      $(this).hover \
        -> target.fadeIn('fast')
        ,
        -> target.fadeOut('fast')

    container.hover \
      -> $('.item-label').fadeIn('fast')
      ,
      -> $('.item-label').fadeOut('fast')

    $('.item')


