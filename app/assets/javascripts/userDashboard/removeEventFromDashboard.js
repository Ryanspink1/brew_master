function addEventToListFromDashboard(method, event_id, i){
  $.ajax({
      url: `/api/v1/user_events`,
      type: method,
      data:{event_id: event_id},
      success: function(data){
        flash(method)
        resetDashboard(i)
      }
    })
}

function resetDashboard(i){
  updateDashboardEventsData(i)
  repopulateEvents()
}

function clearUserDashboardEvents(){
  $("#user-dashboard-events-list").empty()
}

function updateDashboardEventsData(i){
  dashboardEventsData.response.splice(i, 1)
}

function repopulateEvents(){
  populateUserDashboardEvents(0)
}
