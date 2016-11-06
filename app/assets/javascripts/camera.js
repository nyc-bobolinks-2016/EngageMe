// Elements for taking the snapshot
$(document).ready(function(){
  canvas = document.getElementById('canvas');
  context = canvas.getContext('2d');
  video = document.getElementById('videoElement');
  var presentation = false;
  var calls = 0;
  var myInterval;

  function doAjax(){
    calls += 1;
    console.log(calls);
    context.drawImage(video, 0, 0, 640, 480);
    var startingPic = canvas.toDataURL("snapshot/jpg");
    var pic = startingPic.replace(/^data:image\/(png|jpg);base64,/, "")
    var url = (window.location.pathname).split("/run")[0] + '/snapshot';
    
    $.ajax({
      url: url,
      type: 'post',
      data: {pic: pic}
    }).done(function(response){
      var emotions = Object.keys(response)
      for(i=0; i < emotions.length; i++){
         $('#' + emotions[i]).animate({
           fontSize: response[emotions[i]]
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
      console.log(presentation)
      console.log("I'm inside true");
      $('#start').html('resume')
      presentation = false
    } else {
      console.log("I'm inside false");
      console.log(presentation)
      $('#start').html('pause')
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
