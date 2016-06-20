//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('LineChannel', {

  received: function(data) {
    var newlineField = $('#newline[data-tale-id="' + data.tale_id + '"]');

    if ( data.tale_open == false && $('#curr_user_id').length > 0 ) {
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

    if ( (data.hide || data.content != undefined) && data.done != true && data.user_id != $('#curr_user_id').val() ) {
      $('#wait-message').text('Someone is currently adding to this tale. Please stand by.')
    }
    else {
      $('#wait-message').empty()
    }

    if ( data.done ) {
      if ( newlineField.parent("#outerspan").length > 0 ) {
        var parentElem = newlineField.parent("#outerspan");
        var linetext = parentElem.clone().children().remove().end().text();
        var childElem = parentElem.children()[0];
        childElem.text("");
        parentElem.text(linetext +" " + data.content);
        parentElem.append(childElem);

      }
      $('#tale_content').append(data.display_line)
      showAuthors()

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
        var remainingCount = 250 - $('#newline').text().length
        if (remainingCount < 0) {
          $('#character-count').text('You have passed the limit.')
          $("#save").hide()
          $('#newline').css('background-color', 'rgb(212, 105, 87)')
        }
        else {
          if ( !$("#save").is(":visible") ) {
            $("#save").show()
            $("html, body").scrollTop($(document).height());
          }
          $('#character-count').text('(' + remainingCount + ' characters remaining)')
          $('#newline').css('background-color', 'rgb(250, 255, 189)')
        }
      }
    });
  });

  $("#participate_btn").on("click", function(){
    $("html, body").scrollTop($(document).height());
    $.ajax({
      method: "POST",
      url: "/createline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val()},
      success: function(){
        setTimeout(function(){$("#newline").focus()}, 100)}
    })
  });

  $("#save_btn").on("click", function(e){
    $("html, body").scrollTop($(document).height());
    var content = $('#newline')[0].innerText;

    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true}
    })
  });

  $("#close_btn").on("click", function(e){
    $("html, body").scrollTop($(document).height());
    var content = $('#newline')[0].innerText;
    $.ajax({
      method: "POST",
      url: "/saveline",
      data: {id: $("#curr_user_id").val(), tale: $("#tale_id").val(), content: content, done: true, closed: true}
    })
  })
});
