$(function() {
  revealDisplays()
  showAuthors()
    showTitles()
})

function checkMaxlength(line)
{
      var max = parseInt(line.getAttribute('maxlength'));
      var current = line.value.length;

      if ( line.getAttribute && current > max )
      {
          line.value = line.value.substring(0, max);
      }
} //@ END OF DjCheckMaxlength()


function revealDisplays() {
  $('.reveal .menu-header').last().css('border-bottom','1px solid');
  $('.reveal .items').hide();
  $('.reveal .menu-header').on('click', function() {
    $(this).toggleClass("active");
    $(this).children('h2').children().text(function(i, text){
          return text === "+" ? "x" : "+";
      })
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