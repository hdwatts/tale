$(function(){$('.newtale').on("keyup", function(){
  setRemainingCount(this)
})
})

var setRemainingCount = function(div){
  if (div.id === "newtaletitle") {
    var remainingCount = 65 - $(div).val().length
  }
  else {
    var remainingCount = 250 - $(div).val().length
  }
  if (remainingCount < 0) {setTimeout(function(){
    $(div).siblings().last().text('You have passed the limit.')
    $(div).css('background-color', 'rgb(212, 105, 87)')}), 0
  }
  else if ((remainingCount == 65 && div.id === "newtaletitle") || (remainingCount == 250 && div.id != "newtaletitle")) {
    $(div).siblings().last().text('')
    $(div).css('background-color', 'rgb(250, 255, 189)')
  }
  else {setTimeout(function(){

    $(div).siblings().last().text('(' + remainingCount + ' characters remaining)')
    $(div).css('background-color', 'rgb(250, 255, 189)')
  }, 0 )}
}