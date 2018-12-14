$(function() {

  $(".wrapper .menuicon").on("click", show);


  function show() {
    $("nav ul").stop().slideToggle();
  }

  function hide() {
    $("nav ul").stop().slideUp();
  }

  $(window).on("resize", ulBump);



  function ulBump() {
    if (
      $(window).innerWidth() > 768
    ) {
      $("nav ul").show();
    } else {
      $("nav ul").hide();
    }
  }
});
