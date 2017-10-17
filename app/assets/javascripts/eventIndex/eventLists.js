
function startGettingEvents(){
  var events = ["new", "current"]
  for(i=0; i<events.length; i++){
    getNewEvents(events[i])
  }
}

function getNewEvents(events){
$.ajax({
    url: `http://localhost:3000/api/v1/events/${events}_events`,
    type: 'get',
    success: function(data){
      populateNewEvents(data, events)
    }
  })
}

function populateNewEvents(data, passedEvent){
  for(i=0; i<data.length; i++){

  $(`#${passedEvent}-events-list`).append(
    `<li class="list-group-item">
       <a href="/events/${data[i].id}">${data[i].name}</a><br>
       ${formatDate(new Date(data[i].start_time))} - ${formatDate(new Date(data[i].end_time))}
       <p>Location: ${data[i].place}</p>
       <p>${data[i].description.substr(0,300)}...</p>
     </li>`
    )
  }
}
