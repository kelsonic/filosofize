$(document).ready(function() {
  $("a").on('click', function(event){
    event.preventDefault()
    var link = $(this).attr('href')
    $(this).hide()
  .ajax({
    method: "GET",
    url: link
  })
  .done(function(msg){
    $(".deep-purple-text").append(msg)
  })
  })
});
