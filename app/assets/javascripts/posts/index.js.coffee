window.bind_hover = ->
  $('.masonry-brick').hover ->
    $('.hidden-info', this).removeClass 'hidden'
    # $(this).addClass 'post-frame'
  , ->
    # $(this).removeClass 'post-frame'
    $('.hidden-info', this).addClass 'hidden'

$ ->
  if $('#masonry-container').length
    $('.masonry-brick').css('opacity', '0')

    masonry_container = $('#masonry-container')

    masonry_container.imagesLoaded ->
      masonry_container.masonry
        itemSelector: '.masonry-brick'
        columnWidth: 220
        gutterWidth: 16
      $('.masonry-brick').animate
        opacity: 1
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
