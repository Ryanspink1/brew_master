function formatDate(date){
  var monthNames = [
    "Jan", "Feb", "Mar",
    "Apr", "May", "June", "July",
    "Aug", "Sept", "Oct",
    "Nov", "Dec"
  ];
  var dayNames = [
    "Mon", "Tues", "Wed",
    "Thurs", "Fri", "Sat",
    "Sun"
  ]

  var day = date.getDate();
  var dayIndex = date.getDay();
  var monthIndex = date.getMonth();
  var year = date.getFullYear();

  return dayNames[dayIndex] + " " + monthNames[monthIndex] + ' ' + day + ', ' + year;
}
