function getEventShow(){
  $.ajax({
      url: `/api/v1${window.location.pathname}`,
      type: 'get',
      success: function(data){
        getSanitationInfo(data);
    }
  })
}

function getSanitationInfo(eventInfo){
  $.ajax({
      url: `/api/v1/user_events`,
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
  $("#event-show-header-name").append(
    `
      <h2>${data.name}</h2>
    `)
  $("#event-show-header-place-and-time").append(
    `
      <span style="display:block;">at <a href="/breweries/${data.brewery_id}">${data.place}</a></span>
      ${formatDateWithTime(new Date(data.start_time))}-${formatDateWithTime(new Date(data.end_time))}
    `
  )

  $("#event-show-picture").append(
    `
      <img id="event-cover-image" src=${data.cover} class="img-thumbnail" style="height:350px;">
    `
  )
  $("#event-show-location-place").append(
    `
      <strong>Where:</strong> ${data.place}
    `
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
    `    <span style="white-space: pre-line"><p id="event-description-paragraph">${data.description}</p></span>`
  )
  $("#event-show-location-address").append(
    `<strong>Address:</strong> ${data.address} ${data.city}, ${data.state}`
  )
}
