$ ->
  if $('body').data('controller') != 'users'
    timer = null

    $('.masonry-author > a').hover \
      ->
        clearTimeout timer
        $('.current-popup').removeClass('current-popup')
        $(this).next().addClass('current-popup')

        $('.current-popup').hover \
          ->
            clearTimeout timer
          ,
          ->
            timer = setTimeout ->
              $('.current-popup').removeClass('current-popup')
            , 500
      ,
      ->
        timer = setTimeout ->
          $('.current-popup').removeClass('current-popup')
        , 1500

