$ = jQuery;
$ ->

  $('#collab_img').click( -> 
    $(this).fadeOut(); 
    $('#collab_iframe').attr( 'src', 'http://ben.balter.com/wordpress-as-a-collaboration-platform/' ).fadeIn(); 
  );
