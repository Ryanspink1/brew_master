var breweryResponse = {
  info:null
}

function getBreweryShow(){
  $.ajax({
      url: `/api/v1${window.location.pathname}`,
      type: 'get',
      success: function(data){
        breweryResponse.info = data
        populateBreweryShow();
        populateBreweryInfo();
      }
    })
}


function populateBreweryShow(){
  $("#brewery-show-header").append(
    `<h2>${breweryResponse.info.name}</h2>`
  )
  $("#brewery-show-picture").append(
    `<img id="brewery-cover-image" src=${breweryResponse.info.photo} class="img-thumbnail" style="height:350px;">`
  )

  $("#brewery-show-description").append(
    `<span style="white-space: pre-line"><p id="brewery-description-paragraph">${breweryResponse.info.description}</p></span>`
  )
}

var info = {
  instances: [{name:"description", capName:"Description", function: populateDescriptionInfo},
              {name:"address", capName:"Address", function: populateAddressInfo},
              {name:"contact", capName:"Contact", function: populateContactInfo}]
}

function populateBreweryInfo(){
  info.instances.forEach(function(instance, index){
    $('#brewery-show-info-container').append(`
      <div class="row">
        <div class="col">
        </div>
        <div class="col">
          <div class="brewery-show-info-instance ${index}">
            <div class="brewery-show-info-instance-header" id="trigger-info-${instance.name}-${index}">
              ${instance.capName}
            </div>
            <div class="brewery-show-info-instance-body ${index}">
            </div>
          </div>
        </div>
        <div class="col">
        </div>
      </div>
      <script>
        $("#trigger-info-${instance.name}-${index}").click(function(){
            $(this).toggleClass("active")
            $(".brewery-show-info-instance-body.${index}").slideToggle("normal");
        });
      </script>
      <script>
        $(".brewery-show-info-instance-body.${index}").hide();
      </script>
    `)
    instance.function(index)
  })
}

function populateDescriptionInfo(index){
  $(`.brewery-show-info-instance-body.${index}`).append(`
      <span style="white-space: pre-line">
        <p id="brewery-show-info-about">${breweryResponse.info.about}</p>
      </span>
      <span style="white-space: pre-line">
        <p id="brewery-show-info-description">${breweryResponse.info.description}</p>
      </span>
    `)
}

function populateContactInfo(index){
  $(`.brewery-show-info-instance-body.${index}`).append(`
    <p style="text-align: center;">
      Phone: ${breweryResponse.info.phone}<br>
      Email: ${breweryResponse.info.email}
    </p>
    `)
}

function populateAddressInfo(index){
  $(`.brewery-show-info-instance-body.${index}`).append(`
      <p style="text-align: center;">
        ${breweryResponse.info.address}<br>
        ${breweryResponse.info.city}, ${breweryResponse.info.state}
      </p>
    `)
}
