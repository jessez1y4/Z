$("#bookmark-btn").html "<%=j render('tags/unbookmark', tag: @tag) %>"
$('#header').html "<%=j render conditional_header %>"

$('#unbookmark-btn').hover ->
  $(this).val('Unbookmark')
, ->
  $(this).val('Bookmarked')
