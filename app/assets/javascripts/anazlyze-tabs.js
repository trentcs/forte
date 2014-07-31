$(document).ready(function(){
  $('#pitch_range_container').show();
  $(window).resize();
  $("li").click(function(){
    var hrefValue = $(this).children().attr("href");
    $('.active').removeClass("active");
    $(this).children().eq(0).addClass("active");
  
    $(".chart").hide();
    console.log(hrefValue);
    $(hrefValue).show();
   $(window).resize();
  });
});



