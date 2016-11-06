// Elements for taking the snapshot
$(document).ready(function(){
  canvas = document.getElementById('canvas');
  context = canvas.getContext('2d');
  video = document.getElementById('videoElement');

  $('#snap').on("click", function(){
    context.drawImage(video, 0, 0, 640, 480);
    var startingPic = canvas.toDataURL("snapshot/jpg");
    var pic = startingPic.replace(/^data:image\/(png|jpg);base64,/, "")
    var url = (window.location.pathname).split("/run");
    $.ajax({
      url: url,
      type: 'post',
      data: {pic: pic}
    }).done(function(response){
      var emotions = Object.keys(response)
      for(i=0; i < keys.length; i++){
	       $('#' + keys[i]).css('font-size', response[keys[i]]);
       }
    })
  })
})
