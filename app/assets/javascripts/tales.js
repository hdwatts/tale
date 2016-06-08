$(function() {
  revealDisplays()
  showAuthors()
  showTitles()
})

function revealDisplays() {
  $('.reveal .menu-header').last().css('border-bottom','1px solid');
  $('.reveal .items').hide();
  $('.reveal .menu-header').on('click', function() {
    $(this).toggleClass("active");
    $(this).children('h3').children().children().toggleClass('fa-plus')
    $(this).children('h3').children().children().toggleClass('fa-times')
    $(this).siblings().slideToggle( "slow");
  });
}

function showAuthors() {
  $( ".tale.show .line").mouseover(function() {
    $( this ).addClass('active');
  })
  $( ".tale.show .line").mouseout(function() {
    $( this ).removeClass('active');
  });
}

function showTitles() {
  if ( $(".tale.show #title").length > 0 ) {
    $(".tale.show #title").hide();
    var topofDiv = $(".tale.show .foot").offset().top;
    $(window).scroll(function(){
      if($(window).scrollTop() > topofDiv){
         $(".tale.show #title").show();
      } else {
         $(".tale.show #title").hide();
      }
    })
  }
}