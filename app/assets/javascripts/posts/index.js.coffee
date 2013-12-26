$ ->
  if $('body.posts-index').length

    $('#paginate-containter').hide()

    $(window).scroll ->
      url = $('.pagination a[rel=next]').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text("Fetching more products...")
        $('#load-more').animate
          opacity: 0.9

        $.getScript url
