function formatDate(date){
  var monthNames = [
    "Jan", "Feb", "Mar",
    "Apr", "May", "June", "July",
    "Aug", "Sept", "Oct",
    "Nov", "Dec"
  ];
  var dayNames = [
    "Sun", "Mon", "Tues", "Wed",
    "Thurs", "Fri", "Sat"
  ]

  var day = date.getDate();
  var dayIndex = date.getDay();
  var monthIndex = date.getMonth();
  var year = date.getFullYear();

  return dayNames[dayIndex] + " " + monthNames[monthIndex] + ' ' + day + ', ' + year;
}

function formatDateWithTime(date){
  var monthNames = [
    "Jan", "Feb", "Mar",
    "Apr", "May", "June", "July",
    "Aug", "Sept", "Oct",
    "Nov", "Dec"
  ];
  var dayNames = [
    "Sun", "Mon", "Tues", "Wed",
    "Thurs", "Fri", "Sat"
  ]

  var minutes = correctForMinutes(date.getMinutes())
  var hours = correctForHours(date.getHours())
  var day = date.getDate();
  var dayIndex = date.getDay();
  var monthIndex = date.getMonth();
  var year = date.getFullYear();

  return dayNames[dayIndex] + " " + monthNames[monthIndex] + ' ' + day + ', ' + year + ' at ' + hours.hours +
  ":" + minutes + " " + hours.timeOfDay ;
}

function correctForHours(hours){
  if(hours > 12){
    hours = hours-12
    timeOfDay = " p.m."
  }else if(hours == 0){
    hours = 12
    timeOfDay = " a.m."
  }else{
    timeOfDay = " a.m."
  }
  return {hours:hours, timeOfDay:timeOfDay}
}

function correctForMinutes(minutes){
  if(minutes < 10){
    minutes = "0" + minutes
  }
  return minutes
}
