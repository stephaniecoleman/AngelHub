
// Make flash alerts and notices fade out after they appear on the screen. 
$(function() {
   $('.alert').delay(500).fadeIn('normal', function() {
      $(this).delay(1500).fadeOut();
   });
});