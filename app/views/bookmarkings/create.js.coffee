$("#bookmark-btn").html "<%=j render('tags/unbookmark', tag: @tag) %>"
$('#nav-menu').html "<%=j render 'partials/nav_menu' %>"

$('#unbookmark-btn').hover ->
  $(this).val('Unbookmark')
, ->
  $(this).val('Bookmarked')
