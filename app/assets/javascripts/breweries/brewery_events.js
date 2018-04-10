var brewery_id = window.location.href.substr(this.location.href.lastIndexOf('/') + 1)

var breweryData = {
  breweryEvents: null,
  userEvents: [null]
}

function getBreweryEvents(){
  $.ajax({
    url: `/api/v1/events/brewery_events?id=${brewery_id}`,
    method: 'get',
    success: function(data){
      breweryData.breweryEvents = data
      getUserEvents()
    }
  })
}

function getUserEvents(breweryEvents){
  $.ajax({
    url: `/api/v1/user_events`,
    method: 'get',
    success: function(data){
      sanitizeUserEvents(data)
      populateBreweryEvents()
    }
  })
}

function sanitizeUserEvents(data){
    data.forEach(function(event){breweryData.userEvents.push(event.id)})
}

function populateBreweryEvents(){
  breweryData.breweryEvents.forEach(function(event){
    $('#brewery-show-event-instances-container').append(`
      <div class="row">
        <div class="col">
        </div>
        <div class="col">
          <div class="brewery-show-event-instance ${event.id}">
            <div class="brewery-show-event-instance-header">
              <a href="/events/${event.id}"><strong>${event.name}</strong></a>
              <span class="add-event-button ${event.id}" style="text-align:right; display:none">
                <i id="add-event-icon" class="fa fa-calendar-plus-o fa-lg" aria-hidden="true" onclick="addToUserEvents(this, 'post',${event.id})" style="cursor: pointer; cursor: hand;"></i>
              </span>
              <span class="remove-event-button ${event.id}" style="align:right;  display:none;">
                <i id="remove-event-icon" class="fa fa-calendar-minus-o fa-lg" aria-hidden="true" onclick="addToUserEvents(this, 'DELETE', ${event.id})"style="cursor: pointer; cursor: hand;"></i>
              </span>
            </div>
            <div class="brewery-show-event-instance-body">
            <span>${formatDate(new Date(event.start_time))}-${formatDate(new Date(event.end_time))}</span>
            <p>${event.description.substring(0,150)}...</p>
            </div>
          </div>
        </div>
        <div class="col">
        </div>
      </div>
      `)
showButton(event)
  })
}

function showButton(event){
  if (breweryData.userEvents.includes(event.id)){
    $(`.remove-event-button.${event.id}`).css({"display":"inline"})
  }
  else{
    $(`.add-event-button.${event.id}`).css({"display":"inline"})
  }
}

function addToUserEvents(button, method, eventID){
  $.ajax({
      url: `/api/v1/user_events`,
      type: method,
      data:{event_id: eventID},
      success: function(data){
        resetShowButton(button, method, eventID)
      }
    })
}

function resetShowButton(button, method, eventID){
  flash(method);
  if (method == "post"){
    $(`.add-event-button.${eventID}`).css({"display":"none"})
    $(`.remove-event-button.${eventID}`).css({"display":"inline"})
  }else if (method =="DELETE"){
    $(`.add-event-button.${eventID}`).css({"display":"inline"})
    $(`.remove-event-button.${eventID}`).css({"display":"none"})
  }
}
