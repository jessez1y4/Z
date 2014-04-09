$ ->
  masonry_container = $('#user-masonry-container')

  if masonry_container.length
    $('.user-brick').css('opacity', '0')

    masonry_container.imagesLoaded ->
      masonry_container.masonry
        itemSelector: '.user-brick'
        columnWidth: 298
        gutterWidth: 18
    $('.user-brick').css('opacity', '1')

    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')

      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text("Fetching more products...")
        $('#load-more').css('opacity', 1)

        $.getScript url
