function addEventToListFromDashboard(method, event_id){
  $.ajax({
      url: `/api/v1/user_events`,
      type: method,
      data:{event_id: event_id},
      success: function(data){
        flash(method)
        resetDashboard()
      }
    })
}

function resetDashboard(){
  $("#user-dashboard-events-list").empty()
  $("#user-dashboard-events-pagination").empty()
  userDashboardEventsBrain(0)
}
