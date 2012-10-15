$ = jQuery
$ ->
	
	resume_resize = ->
		$('.resume .bar').height( $('.content').height() - 25);		
	
	resume_resize();
	
	$(window).resize( resume_resize );

