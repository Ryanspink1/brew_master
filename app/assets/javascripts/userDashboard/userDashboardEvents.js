function userDashboardEventsBrain(pageNumber){
  $.ajax({
      url: `/api/v1/user_events`,
      type: "get",
      success: function(data){
        dashboardEventsData.response = data
        // populateUserDashboardEvents(data, pageNumber)
        dashboardShowPagination(data, pageNumber)
      }
    })
}

var dashboardEventsData = {
  response : null
}

function pageCount(number){
  return Math.ceil(number.length / 10)
}

function dashboardShowPagination(data, pageNumber){
  var numberOfPages = pageCount(data)
  for (i=0;i<numberOfPages;i++){
    $("#user-dashboard-events-pagination").append(`
      <span class="dashboard-pagination-numbers" onclick="scrollToTop(); populateUserDashboardEvents(0, ${(i)});">${i+1}</span>`)
  }
  populateUserDashboardEvents(data, pageNumber)
}

function clearUserDashboardEvents(){
  $("#user-dashboard-events-list").empty()
}

function populateUserDashboardEvents(userEvents, page){
  clearUserDashboardEvents()
  userEvents = dashboardEventsData.response
  for(i=(0+10*page);i<(9+10*page);i++){
  // userEvents.forEach(function(event){
    $("#user-dashboard-events-list").append(
      `<div class="user-dashboard-event">
      <u>${formatDate(new Date(userEvents[i].start_time))}</u>-<u>${formatDate(new Date(userEvents[i].end_time))}</u>
        <p>
          <a href=/events/${userEvents[i].id}>${userEvents[i].name}</a>
          <br>
            Remove:  <i id="removeEventButton" class="fa fa-calendar-minus-o fa-lg" aria-hidden="true" onclick="addEventToListFromDashboard('DELETE', ${userEvents[i].id})"style="cursor: pointer; cursor: hand;"></i>
          <br>
        </p>
      </div>`
    )
  }
}
