$("#bookmark-btn").html "<%=j render('tags/bookmark', tag: @tag) %>"
$('#nav-menu').html "<%=j render 'partials/nav_menu' %>"

$('#bookmark-btn span').aToolTip
  xOffset: -300
