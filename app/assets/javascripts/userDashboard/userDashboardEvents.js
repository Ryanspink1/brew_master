var dashboardEventsData = {
  response : null
}

function pageCount(number){
  return Math.ceil(dashboardEventsData.response.length / 10)
}

function userDashboardEventsBrain(pageNumber){
  $.ajax({
      url: `/api/v1/user_events`,
      type: "get",
      success: function(data){
        dashboardEventsData.response = data
        dashboardShowPagination(pageNumber)
      }
    })
}

function dashboardShowPagination(pageNumber){
  var numberOfPages = pageCount()
  for (i=0;i<numberOfPages;i++){
    $("#user-dashboard-events-pagination").append(`
      <span class="dashboard-pagination-numbers" onclick="scrollToTop(); populateUserDashboardEvents(${(i)});">${i+1}</span>`)
  }
  populateUserDashboardEvents(pageNumber)
}

function populateUserDashboardEvents(page){
  clearUserDashboardEvents()
  userEvents = dashboardEventsData.response
  for(i=(0+10*page);i<(9+10*page);i++){
    $("#user-dashboard-events-list").append(
      `
      <div class="row justify-content-center">
        <div class="col">
        </div>
        <div class="col">
          <div class="user-dashboard-event">
             <div class="user-dashboard-event-header">
              <a href=/events/${userEvents[i].id}>${userEvents[i].name}</a>
              <i id="removeEventButton" class="fa fa-calendar-minus-o fa-lg" aria-hidden="true" onclick="addEventToListFromDashboard('DELETE', ${userEvents[i].id}, ${i})"style="cursor: pointer; cursor: hand;"></i>
              <span style="display:block;">at <a href="/breweries/${userEvents[i].brewer_id}">${userEvents[i].place}</a></span>
             </div>
             <div class="user-dashboard-event-body">
               <span style="display:block;margin-bottom:1vh;">${formatDateWithTime(new Date(userEvents[i].start_time))}-${formatDateWithTime(new Date(userEvents[i].end_time))}</span>
               <p>${userEvents[i].description.substring(0,150)}...</p>
             </div>
          </div>
        </div>
        <div class="col">
        </div>
      </div>
      `
    )
  }
}
