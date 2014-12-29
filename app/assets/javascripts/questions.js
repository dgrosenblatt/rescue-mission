var ready = function() {
  questions.init();
};

var questions = {
  init: function() {

    $( window ).on("scroll", function(){
      if (parseInt($(window).scrollTop()) + parseInt(window.innerHeight) >= $( 'html' ).height()) {
        $( "#next" ).animate({
          width: "+=5%"
        }, 2000, function(){
          $.ajax({
            url: "/questions/next/" + $( ".question" ).length,
            cache: false
          })
          .done(function( html ) {
            $( ".question" ).last().after( html );
            $( "#question-index-title" ).text($( ".question" ).length + " Most Recent Questions");
          });
        });
      }
    });
  }
};


$(document).ready(ready);
$(document).on('page:load', ready);
