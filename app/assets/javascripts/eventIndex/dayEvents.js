
function todayEventsBrain(){
  clearCurrentData()
  currentEventDate.date = new Date
  changeEventDateHeader()
  getTodayEvents()
}

function allEventsBrain(){
  clearCurrentData()
  $("#current-event-date-header-capsule").hide()
  currentEventDate.date = new Date
  getNewEvents("current")
}

function clearCurrentData(){
  $('#current-event-body').empty()
}

function getTodayEvents(){
  today = new Date
  $.ajax({
    url: `/api/v1/events/today`,
    type: 'get',
    success:function(data){populateNewEvents(data, "current")
    }
  })
}

var currentEventDate = {
  date: new Date
}

function currentEventDateChange(dateModifier){
  currentEventDate.date.setDate(currentEventDate.date.getDate() + dateModifier)
  changeEventDateHeader()
  getModifiedDateEvents()
}

function getModifiedDateEvents(){
  $.ajax({
    url:  '/api/v1/events/modified_date_events',
    type: 'get',
    data: {date: currentEventDate.date.getTime()/1000},
    success: function(data){
      clearCurrentData()
      populateNewEvents(data, "current")}
  })
}

function changeEventDateHeader(){
  $("#current-event-date-header-capsule").show()
  $("#current-event-date-header-capsule")[0].innerHTML=`${formatDate(currentEventDate.date)}`
}
