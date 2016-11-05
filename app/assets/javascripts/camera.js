// Elements for taking the snapshot
$(document).ready(function(){
  canvas = document.getElementById('canvas');
  context = canvas.getContext('2d');
  video = document.getElementById('videoElement');

  $('#snap').on("click", function(){
    context.drawImage(video, 0, 0, 640, 480);
    var pic = canvas.toDataURL("snapshot/jpg");
    pic = pic.replace(/^data:image\/(png|jpg);base64,/, "")

    $.ajax({
      url: '/presentations/snapshot',
      type: 'post',
      data: {pic: pic}
    }).done(function(response){
      console.log(response);
    })
  })
})
