$(document).ready(function() {
  $("#main-login").on('click', function(event){
    event.preventDefault();
    var link = $(this).attr('href');
    $(this).hide();
  $.ajax({
    method: "GET",
    url: link
  })
    .done(function(msg){
      console.log(msg)
      $("put-form-here").append(msg)
    })
  })
});
