App.messages = App.cable.subscriptions.create('LineChannel', {  
  received: function(data) {
    if ( $('#newline').attr("contenteditable") != "true" ) {
      return $('#newline').text(this.renderMessage(data));
    } else {
      return ""
    }
  },

  renderMessage: function(data) {
    return ""+data.content;
  }
});

$(function(){
  $('#newline').on("keyup", function(){
    var content = $(this).text();
    $.ajax({
      method: "POST",
      url: "/updateline",
      data: {id: "1", content: content}
    });
  });
});