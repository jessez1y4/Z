$ ->
  if $('body.users-show').length
    masonry_container = $('#masonry-container')
    masonry_container.imagesLoaded ->
      masonry_container.masonry
        itemSelector: '.small-post'
        columnWidth: 190
        gutterWidth: 15

    $('#paginate-containter').hide()

    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 200
        $('.pagination').text("Fetching more products...")
        $('#load-more').animate
          opacity: 1

        $.getScript url
