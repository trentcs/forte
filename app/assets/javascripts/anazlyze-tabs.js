$(document).ready(function() {
  $('#pitch_range').show();
  $('li').click(function(){
    var hrefValue = $(this).children().attr("href")
    $('.active').removeClass("active");
    $(this).addClass("active");
    $(".chart").hide();
    console.log(hrefValue);
    $(hrefValue).show();
  })


})