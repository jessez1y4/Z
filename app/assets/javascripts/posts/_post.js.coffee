$ ->
  if $('body').data('controller') != 'users'
    $('.masonry-brick').hover \
      ->
        $('.user-name', this).css 'opacity', 1
        $('.post-stats', this).css 'opacity', 0
      ,
      ->
        $('.user-name', this).css 'opacity', 0
        $('.post-stats', this).css 'opacity', 1
