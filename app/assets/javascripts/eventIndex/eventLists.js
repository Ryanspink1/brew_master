
var allEvents = {
  userEvents:[null]
}


function startGettingEvents(){
  var events = ["new", "current"]
  for(i=0; i<events.length; i++){
    getNewEvents(events[i])
  }
}

function getNewEvents(events){
  $.ajax({
    url: `/api/v1/events/${events}_events`,
    type: 'get',
    success: function(data){
      userEvents(events,data)

    }
  })
}

function userEvents(events, retrieved_events){
  $.ajax({
    url: `/api/v1/user_events`,
    method: 'get',
    success: function(data){
      sanitizeEvents(data)
      populateNewEvents(retrieved_events, events)
    }
  })
}

function sanitizeEvents(data){
    data.forEach(function(event){allEvents.userEvents.push(event.id)})
}

function populateNewEvents(data, passedEvent){
  data.forEach(function(event){
    $(`#${passedEvent}-event-body`).append(
      `
        <div class="row justify-content-center">
          <div class="col">
          </div>
          <div class="col">
            <div class="new-event-list-event">
              <div class="new-event-list-event-header">
                <a href="/events/${event.id}">${event.name}</a>
                <span class="add-event-button ${event.id}" style="text-align:right; display:none">
                  <i id="add-event-icon" class="fa fa-calendar-plus-o fa-lg" aria-hidden="true" onclick="addToUserEvents(this, 'POST',${event.id})" style="cursor: pointer; cursor: hand;"></i>
                </span>
                <span class="remove-event-button ${event.id}" style="align:right;  display:none;">
                  <i id="remove-event-icon" class="fa fa-calendar-minus-o fa-lg" aria-hidden="true" onclick="addToUserEvents(this, 'DELETE', ${event.id})"style="cursor: pointer; cursor: hand;"></i>
                </span>
                <span style="display:block;">${formatDate(new Date(event.start_time))} - ${formatDate(new Date(event.end_time))}</span>
                <a href="/breweries/${event.brewery_id}">${event.place}</a>
              </div>
              <div class="new-event-list-event-body">
                <p>${event.description.substr(0,250)}...</p>
              </div>
            </div>
          </div>
          <div class="col">
          </div>
        </div>
      `
    )
  changeButtons(event)
  })
}

function changeButtons(event){
  if (allEvents.userEvents.includes(event.id)){
    $(`.remove-event-button.${event.id}`).css({"display":"inline"})
  }
  else{
    $(`.add-event-button.${event.id}`).css({"display":"inline"})
  }
}
