function getBreweryIndex(pageNumber){
  $.ajax({
    url: `http://localhost:3000/api/v1/breweries`,
    success: function(data){
      breweryIndexPagination(pageNumber, data)
    }
  })
}

function breweryPageCount(number){
  return Math.ceil(number.length / 40)
}

function breweryIndexPagination(pageNumber, data){
  clearBreweryIndexPagination()
  var numberOfPages = breweryPageCount(data)
  for (i=0;i<numberOfPages;i++){
    $("#brewery-index-pagination").append(`
      <span class="brewery-index-pagination-numbers" onclick="scrollToTop(); getBreweryIndex(${(i)});">${i+1}</span>`)
  }
  populateBreweryIndex(pageNumber, data)
}

function clearBreweryIndex(){
  $("#brewery-index-table").empty()
}
function clearBreweryIndexPagination(){
  $("#brewery-index-pagination").empty()
}


function populateBreweryIndex(page, data){
  clearBreweryIndex()
  for(i=(0+40*page);i<(39+40*page);i++){
    $("#brewery-index-table").append(
      `<tr>
      <th scope = "row">${data[i].name}</th>
        <td>${data[i].address}</td>
        <td>${data[i].city}</td>
      </tr>
      `
    )
  }
}
