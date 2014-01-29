$('#post-comments-main').html "<%=j render @comments %>"
$('#post-comments-prev').html "<%=j link_to_previous_page @comments, 'Previous', remote: true, class: 'btn btn-default' %>"
$('#post-comments-next').html "<%=j link_to_next_page @comments, 'View More', remote: true, class: 'btn btn-default' %>"
