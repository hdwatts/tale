App.messages = App.cable.subscriptions.create('LineChannel', {  

  received: function(data) {
    if ( data.tale_id == $('#tale_id').val() ) {
      if ( data.tale_open == false ) {
        location.reload()
      }
      if ( data.user_id == $('#curr_user_id').val() ) {
        if ( $('#newline').attr("contenteditable") != "true" ) {
          $('#newline').attr("contenteditable", "true");
        }
        if ( data.hide ) {
          $("#save").show();
          if ( data.owner_id == $('#curr_user_id').val()) {
            $("#close").show();
          }
        }
      } else {

        $('#newline').text(this.renderMessage(data));
      }

      if ( data.hide ) {
        $('#participate').hide();
      }

      if ( data.done ) {
        $('#tale_content').append(data.display_line)

        $('#newline').attr("contenteditable", "false");
        $('#newline').text("")
        $("#save").hide();
        $("#close").hide();

        if ( data.user_id != $('#curr_user_id').val() ) {
          $("#participate").show();
        }
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
    var content = $(this).text();
    $.ajax({
      method: "POST",
      url: "/updateline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content}
    });
  });

  $("#participate_btn").on("click", function(e){
    $.ajax({
      method: "POST",
      url: "/createline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val()}
    })
  });

  $("#save_btn").on("click", function(e){
    var content = $('#newline').text();

    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true}
    })
  });

  $("#close_btn").on("click", function(e){
    var content = $('#newline').text();
    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true, closed: true}
    })
  })
});
