  // events=[];
  // $.ajax({
  //   type: 'GET',
  //   url: 'https://api.burningman.org/api/v1/event?year=2016',
  //   dataType: 'json',
  //   beforeSend: function (xhr) {
  //     xhr.setRequestHeader ("Authorization", "Basic YjQyZTg4YjM3MzQxM2I4ODNiOWUyNDYzOTc2ZTY2YTk6");
  //   }
  //   headers: {
  //     'Authorization': 'Basic YjQyZTg4YjM3MzQxM2I4ODNiOWUyNDYzOTc2ZTY2YTk6'
  //    "username":"b42e88b373413b883b9e2463976e66a9"
  //   }
  // }).done(function(data){
  //   if (data[0].event_type.label === "Class/Workshop")
  //   console.log(data);
  //   // data.title + data.description;
  //
  // });
  $(document).ready(function(){
  function getTimeRemaining(endtime) {
    var t = Date.parse(endtime) - Date.parse(new Date());
    var seconds = Math.floor((t / 1000) % 60);
    var minutes = Math.floor((t / 1000 / 60) % 60);
    var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
    var days = Math.floor(t / (1000 * 60 * 60 * 24));
    return {
      'total': t,
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds
    };
  }

  function initializeClock(id, endtime) {
    var clock = document.getElementById(id);
    var daysSpan = clock.querySelector('.days');
    var hoursSpan = clock.querySelector('.hours');
    var minutesSpan = clock.querySelector('.minutes');
    var secondsSpan = clock.querySelector('.seconds');

    function updateClock() {
      var t = getTimeRemaining(endtime);

      daysSpan.innerHTML = t.days;
      hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
      minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
      secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

      if (t.total <= 0) {
        clearInterval(timeinterval);
      }
    }

    updateClock();
    var timeinterval = setInterval(updateClock, 1000);
  }

  var deadline = '2016-08-27';
  // var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
  initializeClock('clockdiv', deadline);
});
  //Source: http://codepen.io/SitePoint/pen/MwNPVq
