function getEventShow(){
  $.ajax({
      url: `http://localhost:3000/api/v1${window.location.pathname}`,
      type: 'get',
      success: function(data){
        // populateEventShow(data);
        getSanitationInfo(data);
      }
    })
}

function getSanitationInfo(eventInfo){
  $.ajax({
      url: `http://localhost:3000/api/v1/user_events`,
      type: 'get',
      success: function(data){
        sanitize(eventInfo, data);
      }
    })
}

function sanitize(eventInfo, sanitationInfo){
  var sanitationIds = []
  sanitationInfo.forEach(function(record){sanitationIds.push(record.id)})

  if (sanitationIds.includes(eventInfo.id)) {
    $("#add-event-to-list-button").css({"display":"none"})
    $("#remove-event-from-list-button").css({"display":"inline"})
  }else{
    $("#add-event-to-list-button").css({"display":"inline"})
    $("#remove-event-from-list-button").css({"display":"none"})
  }
  populateEventShow(eventInfo)
}


function populateEventShow(data){
  $("#event-show-header").append(
    `<h2>${data.name}</h2>`
  )
  $("#event-show-picture").append(
    `<img id="event-cover-image" src=${data.cover} class="img-thumbnail" style="height:350px;">`
  )
  $("#event-show-location-place").append(
    `<strong>Where:</strong> ${data.place}`
  )
  $("#event-show-location-start-time").append(
    `<strong>Start Time:</strong> ${new Date(data.start_time)}`
  )
  $("#event-show-location-end-time").append(
    `<strong>End Time:</strong> ${new Date(data.end_time)}`
  )
  $("#add-event-to-list-button").append(
    `<strong>Add Event to List:</strong>
    <i id="addEventButton" class="fa fa-calendar-plus-o fa-lg" aria-hidden="true" onclick="addEventToList('post',${data.id})" style="cursor: pointer; cursor: hand;"></i>`
  )
  $("#remove-event-from-list-button").append(
    `<strong>Remove Event from List:</strong>
    <i id="removeEventButton" class="fa fa-calendar-minus-o fa-lg" aria-hidden="true" onclick="addEventToList('DELETE', ${data.id})"style="cursor: pointer; cursor: hand;"></i>`
  )
  $("#event-show-description").append(
    `<p id="event-description-paragraph" style="text-indent: 30px;">${data.description}</p>`
  )
  $("#event-show-location-address").append(
    `<strong>Address:</strong> ${data.address} ${data.city}, ${data.state}`
  )
}
