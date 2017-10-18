var messages = {
  "post":"Event added to list",
  "DELETE":"Event removed from list"
}

var messageColor = {
  "post":"green",
  "DELETE":"red"
}

function flash(method){
  $("#flash-message-insert").css({"color":`${messageColor[method]}`})
  $("#flash-message-insert").css({"border-style":`solid`})
  $("#flash-message-insert").append(
    messages[method]
  )
  setTimeout(flashClear, 2000)
}

function flashClear(){
  $("#flash-message-insert")[0].innerHTML=""
  $("#flash-message-insert").css({"border-style":`none`})
}
