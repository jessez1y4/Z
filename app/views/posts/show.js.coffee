new_comments = $.parseHTML "<%= j render @comments %>"

$('#post-comments-main').append new_comments
$('#post-comments-next').html "<%=j link_to_next_page @comments, 'View More', remote: true, class: 'btn btn-default' %>"
