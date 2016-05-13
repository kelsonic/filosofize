$(document).ready(function() {
  $('select').material_select();
  $('input#input_text, textarea#textarea1').characterCounter();

  $("#main-login").on('click', function(event){
    event.preventDefault();
    var link = $(this).attr('href');
    $(this).hide();
  $.ajax({
    method: "GET",
    url: link
  })
    .done(function(msg){
      $("#put-form-here").after(msg)
    })
  })

  $(".upvotes").on('click', function(event){
    event.preventDefault();
    var link = $(this).attr('action');
  $.ajax({
    method: "POST",
    url: link
  })
    .done(function(msg){
      $(".vote-tally").text(msg)
    })
  })
  $(".downvotes").on('click', function(event){
    event.preventDefault();
    var link = $(this).attr('action');
  $.ajax({
    method: "POST",
    url: link
  })
    .done(function(msg){
      $(".vote-tally").text(msg)
    })
  })

});

