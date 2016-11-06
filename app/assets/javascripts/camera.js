// Elements for taking the snapshot
$(document).ready(function(){
  canvas = document.getElementById('camera-canvas');
  context = canvas.getContext('2d');
  video = document.getElementById('videoElement');
  var presentationOn = false

  function doAjax(){
    context.drawImage(video, 0, 0, 100%, 100%);
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
        doAjax();
       }
    })
  }

  $('#snap').on("click", function(){
    if(presentation){
      presentation = true
    } else
  })
})
