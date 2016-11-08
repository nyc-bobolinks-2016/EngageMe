// Elements for taking the snapshot
$(document).ready(function(){
  var canvas = document.getElementById('camera-canvas');
  var context = canvas.getContext('2d');
  var video = document.getElementById('videoElement');
  var presentation = false,
      myInterval,
      timerTime = parseInt($('#clock').attr('value')),
      url = (window.location.pathname).split("/run")[0] + '/snapshot';

  var videoWidth = video.offsetWidth;
  var videoHeight = video.offsetHeight;

  function doAjax(){
    canvas.height = videoHeight;
    canvas.width = videoWidth;
    context.drawImage(video, 0, 0, videoWidth, videoHeight);
    var startingPic = canvas.toDataURL("snapshot/jpg");
    var pic = startingPic.replace(/^data:image\/(png|jpg);base64,/, "");

    $.ajax({
      url: url,
      type: 'post',
      data: {
        pic: pic,
        time_taken: $('#clock').data('seconds')
      }
    }).done(function(response){
      var emotions = Object.keys(response)
      for(i=0; i < emotions.length; i++){
        $('#' + emotions[i]).css('background-color', response[emotions[i]][1])
         $('#' + emotions[i]).animate({
           width: response[emotions[i]][0]
         }, 1500 );
       }
    })
  }

  $('#stop').on('click', function(){
    var url = (window.location.pathname).split("/run")[0];
    window.location.href = url;
  })

  $('#start').on("click", function(event){
    if(presentation){
      timerTime = $('#clock').data('seconds');
      $('#clock').timer('remove');
      $('#start').attr('value', 'resume');
      presentation = false
    } else {

      $('#start').attr('value', 'pause');

      $('#clock').timer({
        format: '%H:%M:%S',
        seconds: timerTime
      });

      presentation = true
      var myInterval = setInterval(function(){
        if(!presentation){
          clearInterval(myInterval);
        }
        doAjax();
      }, 3000);
    }
  })
})
