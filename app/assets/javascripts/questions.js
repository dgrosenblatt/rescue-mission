var questions = {
  init: function() {
    $("#next").on("click", this.loadNext);
  },
  loadNext: function() {
    $.ajax({
      url: "/questions/next",
      cache: false
    })
    .done(function( html ) {
      $( "#results" ).after( html );
      $( "#question-index-title" ).text("All Questions");
      $( "#next" ).text("All Questions Loaded!").delay(800).fadeOut(800);
    });
  }
};


$(document).ready(function() {
  questions.init();
});
