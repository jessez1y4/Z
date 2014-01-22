$("#bookmark-btn").html "<%=j render('tags/bookmark', tag: @tag) %>"
$('#header').html "<%=j render conditional_header %>"

$('#bookmark-btn span').aToolTip
  xOffset: -300
