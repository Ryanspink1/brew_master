var allBreweries = {
  breweries: null
}

function getBreweryIndex(pageNumber){
  $.ajax({
    url: `/api/v1/breweries`,
    success: function(data){
      allBreweries.breweries = data
      breweryIndexPagination(pageNumber)
    }
  })
}

function breweryPageCount(){
  return Math.ceil(allBreweries.breweries.length / 40)
}

function breweryIndexPagination(pageNumber){
  clearBreweryIndexPagination()
  var numberOfPages = breweryPageCount()
  for (i=0;i<numberOfPages;i++){
    $("#brewery-index-pagination").append(`
      <span class="brewery-index-pagination-numbers" onclick="scrollToTop(); breweryIndexPagination(${(i)});">${i+1}</span>`
    )
  }
  populateBreweryIndex(pageNumber)
}

function clearBreweryIndex(){
  $("#brewery-index-table").empty()
}
function clearBreweryIndexPagination(){
  $("#brewery-index-pagination").empty()
}


function populateBreweryIndex(page){
  debugger;
  breweryIndexScrollToTop()
  clearBreweryIndex()
  for(i=(0+40*page);i<(40+40*page);i++){
    $("#brewery-index-table").append(
      `
        <div class="row justify-content-center">
          <div class="col">
          </div>
          <div class="col">
            <div class="brewery-index-instance" onclick=location.href="/breweries/${allBreweries.breweries[i].id}">
                ${allBreweries.breweries[i].name}
            </div>
          </div>
          <div class="col">
          </div>
        </div>
      `
    )
  }
}
