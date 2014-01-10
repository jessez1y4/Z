$ ->
  if $('#masonry-container').length
    window.bind_hover = ->
      $('.masonry-brick').hover ->
        $('.hidden-info', this).removeClass 'hidden'
        $(this).addClass 'post-frame'
      , ->
        $(this).removeClass 'post-frame'
        $('.hidden-info', this).addClass 'hidden'
    masonry_container = $('#masonry-container')
    if $('.small-post').length
      column = 170
    else
      column = 190
    masonry_container.imagesLoaded ->
      masonry_container.masonry
        itemSelector: '.masonry-brick'
        columnWidth: column
        gutterWidth: 15
      bind_hover()

  if $('body.posts-index').length or $('#masonry-container').length
    $('#paginate-containter').hide()

    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')

      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text("Fetching more products...")
        $('#load-more').animate
          opacity: 1

        $.getScript url
