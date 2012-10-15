$ = jQuery
$ ->
  $('.post-2011-11-29-towards-a-more-agile-government .maruku_toc').hide();
  $('#toggleTOC').click( ->
      event.preventDefault();
      $('.maruku_toc').slideToggle();
      if $(this).text() == 'Show Table of Contents'
        $(this).text('Hide Table of Contents');
      else 
        $(this).text('Show Table of Contents');
      return false;
  );