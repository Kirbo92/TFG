jQuery ->
 $(window).scroll ->
   url = $('#view-more a').attr('href')
   if url && $(window).scrollTop() >= $(document).height() - $(window).height() - 50
     $("#view-more").attr('href', '')
     $.getScript url