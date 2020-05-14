$( document ).on('turbolinks:load', function() {

  function readURL(input) {
    if (input.files && input.files[0]) {

      function setUrl(imgIdx) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(`#img_prev_${imgIdx}`).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[imgIdx]);  
      }

      for (let index = 0; index < input.files.length; index++) {
        $('.img_prev_wrap').prepend(`<img id="img_prev_${index}" src="" width="300" height="200" />`);
        setUrl(index);
      }
    }
  }
 
  $("#post_img").change(function(){
    // $('#img_prev').removeClass('hidden');
    // $('.present_img').remove();
    $(".img_prev_wrap").empty();
    readURL(this);
  });
});