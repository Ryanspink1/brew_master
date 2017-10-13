function getEventShow(){
  $.ajax({
      url: `http://localhost:3000/api/v1${window.location.pathname}`,
      type: 'get',
      success: function(data){
        populateEventShow(data)
      }
    })
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
  $("#event-show-description").append(
    `<p id="event-description-paragraph" style="text-indent: 30px;">${data.description}</p>`
  )
  $("#event-show-location-address").append(
    `<strong>Address:</strong> ${data.address} ${data.city}, ${data.state}`
  )

}
