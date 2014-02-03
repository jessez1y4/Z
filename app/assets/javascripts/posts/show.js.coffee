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

    $('#post-comment-input').focus ->
      $('#post-comment-btn').removeClass 'hidden'

