function addEventToList(method, event_id){
  $.ajax({
      url: `http://localhost:3000/api/v1/user_events`,
      type: method,
      data:{event_id: event_id},
      success: function(data){
        flash(method)
        resetShowPage()
        getEventShow()
      }
    })
}

function resetShowPage(){
$("#event-show-header")[0].innerHTML = ""
$("#event-show-picture")[0].innerHTML = ""
$("#event-show-location-place")[0].innerHTML = ""
$("#event-show-location-start-time")[0].innerHTML = ""
$("#event-show-location-end-time")[0].innerHTML = ""
$("#add-event-to-list-button")[0].innerHTML = ""
$("#remove-event-from-list-button")[0].innerHTML = ""
$("#event-show-description")[0].innerHTML = ""
$("#event-show-location-address")[0].innerHTML = ""
}
