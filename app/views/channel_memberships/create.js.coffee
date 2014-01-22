$("#join-btn").html "<%= escape_javascript(render('channels/leave', channel: @channel)) %>"

$('#leave-btn').hover ->
  $(this).val('Leave')
, ->
  $(this).val('Joined')
