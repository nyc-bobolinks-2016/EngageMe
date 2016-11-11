// Elements for taking the snapshot
$('#run-container').ready(function(){
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
      var emotions_hash = response.emotions
      var emotions = Object.keys(emotions_hash)
      for(i=0; i < emotions.length; i++){
        if(presentation){
          $('#' + emotions[i]).css('opacity', emotions_hash[emotions[i]][1])
          $('#faces').text(response.faces + ' faces detected')
          $('#' + emotions[i]).animate({
            width: emotions_hash[emotions[i]][0]
          }, 1000 );
        }
       }
    })
  }

  $('#stop').on('click', function(){
    $('#faces').hide();
    var url = (window.location.pathname).split("/run")[0];
    $.ajax({
      url: url,
      type: 'put'
    })
  })

  $('#start').on("click", function(event){
    if(presentation){
      timerTime = $('#clock').data('seconds');
      $('#clock').timer('remove');
      $('#start').attr('value', 'Resume');
      $('#faces').hide();
      presentation = false
    } else {

      $('#start').attr('value', 'Pause');
      $('#faces').show().text("Detecting Faces...");
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
      }, 1000);
    }
  })
})
