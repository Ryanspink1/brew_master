function addEventToList(method, event_id){
  $.ajax({
      url: `http://localhost:3000/api/v1/user_events`,
      type: method,
      data:{event_id: event_id},
      success: function(data){
        flash(method)
        resetShowButtons(method)
      }
    })
}

function resetShowButtons(method){
  if (method == "post"){
    $("#add-event-to-list-button").css({"display":"none"})
    $("#remove-event-from-list-button").css({"display":"inline"})
  }else if(method == "DELETE"){
    $("#remove-event-from-list-button").css({"display":"none"})
    $("#add-event-to-list-button").css({"display":"inline"})
  }
}
