App.messages = App.cable.subscriptions.create('LineChannel', {  

  received: function(data) {
    if ( data.tale_id == $('#tale_id').val() ) {

      if ( data.user_id == $('#curr_user_id').val() ) {
        if ( $('#newline').attr("contenteditable") != "true" ) {
          $('#newline').attr("contenteditable", "true");
        }
        if ( data.hide ) {
          $("#save").show();
        }
      } else {

        $('#newline').text(this.renderMessage(data));
      }

      if ( data.hide ) {
        $('#participate').hide();
      }

      if ( data.done ) {
        $('#content').append("<p>" + data.content + " </p>(<b>Written By:</b> " + data.user_link + ")")

        $('#newline').attr("contenteditable", "false");
        $('#newline').text("")
        $("#save").hide();

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
