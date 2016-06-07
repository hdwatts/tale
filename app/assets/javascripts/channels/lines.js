App.messages = App.cable.subscriptions.create('LineChannel', {  

  received: function(data) {
    var newlineField = $('#newline[data-tale-id="' + data.tale_id + '"]');
   
    if ( data.tale_open == false ) {
      location.reload()
    }
    if ( data.user_id == $('#curr_user_id').val() ) {
      if ( newlineField.attr("contenteditable") != "true" ) {
        newlineField.attr("contenteditable", "true");
      }
      if ( data.hide ) {
        if ( data.owner_id == $('#curr_user_id').val()) {
          $("#close").show();
        }
      }
    } else {

      newlineField.text(this.renderMessage(data));
    }

    if ( data.hide ) {
      $('#participate').hide();
    }

    if ( data.done ) {
      $('#tale_content').append(data.display_line)

      newlineField.attr("contenteditable", "false");
      newlineField.text("")
      $("#save").hide();
      $("#close").hide();

      if ( $('#curr_user_id').val() != "" && data.user_id != $('#curr_user_id').val() ) {
        $("#participate").show();
      }
    }
  },

  renderMessage: function(data) {
    if (data.content == undefined) {
      data.content = ""
    }

    return ""+data.content;
  }
});


$(function(){
  $('#newline').on("keyup", function(){
    var content = $(this)[0].innerText;

    $.ajax({
      method: "POST",
      url: "/updateline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content},
      success: function(){
        var remainingCount = 250 - $('#newline').text().trim().length
        if (remainingCount < 0) {
          $('#character-count').text('You have passed the limit.')
          $("#save").hide()
        }
        else {
          $('#character-count').text('(' + remainingCount + ' characters remaining)')
          $("#save").show()
        }  
      }
    });
  });

  $("#participate_btn").on("click", function(){
    $.ajax({
      method: "POST",
      url: "/createline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val()},
      success: function(){
        setTimeout(function(){$("#newline").focus()}, 100)}
    })
  });

  $("#save_btn").on("click", function(e){
    var content = $('#newline')[0].innerText;

    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true}
    })
  });

  $("#close_btn").on("click", function(e){
    var content = $('#newline')[0].innerText;
    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true, closed: true}
    })
  })
});
