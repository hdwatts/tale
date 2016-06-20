
function randomGrid() {
  $('#index-tales .item').each(function(index, item){ 
    var gClass = ['g-1-7','g-2-7','g-3-7','g-4-7','g-1-3','g-2-3','g-2-9','g-3-9','g-4-9','g-5-9']
    var theRange = gClass.length - 1
    var iClass = randomClass(0, theRange)
    $(this).addClass(gClass[iClass]).css('margin-top', randomClass(20, 65)).css('margin-right', randomClass(20, 65)).css('margin-bottom', randomClass(20, 65)).css('margin-left', randomClass(20, 65))
  })
}

function randomClass(min,max) {
    var randomNum = Math.floor(Math.random()*(max-min)+min)
    return randomNum
}



