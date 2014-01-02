$ ->
  if $('body.posts-index').length

    window.bind_hover = ->
      $('.masonry-brick').hover ->
        $('.hidden-info', this).removeClass 'hidden'
        $(this).addClass 'post-frame'
      , ->
        $(this).removeClass 'post-frame'
        $('.hidden-info', this).addClass 'hidden'

    bind_hover()

    if $('#masonry-container').length
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

    $('#paginate-containter').hide()

    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text("Fetching more products...")
        $('#load-more').animate
          opacity: 1

        $.getScript url
