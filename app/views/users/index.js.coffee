$ ->
  new_users = $.parseHTML "<%= j render @users %>"

  masonry_container = $('#user-masonry-container')

  masonry_container.append new_users

  $(new_users).css('opacity', 0)

  masonry_container.imagesLoaded ->
    masonry_container.masonry 'reload'
    $(new_users).css('opacity', 1)

  <% if @users.next_page %>

  $('.pagination').replaceWith("<%= j paginate(@users)%>")
  $('#load-more').css('opacity', 0)

  <% else %>

  $('.pagination').remove()

  $('#load-more').html("The End")

  <% end %>

