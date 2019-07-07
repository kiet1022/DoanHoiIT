$(document).ready(function(){
  
  // init Toggle
  $('[data-toggle="tooltip"]').tooltip();
  // init editor
  CKEDITOR.replace('activityContent', {
    allowedContent: true,
    height: '745',
  });
  CKEDITOR.config.extraAllowedContent = 'audio[*]';
  
  // init date picker
  $('#startDate').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN', 
    autoHide:true,
    inline:true,
    autoPick: true
  });
  $('#endDate').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN', 
    autoHide:true,
    inline:true,
    autoPick: true
  });
  $('#startRegisDate').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN', 
    autoHide:true,
    inline:true,
    autoPick: true
  });
  $('#endRegisDate').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN', 
    autoHide:true,
    inline:true,
    autoPick: true
  });
  
  // Block UI when submit form
  $(document).on('submit',"form", function(e){
    blockUI(true);
  });
});

$('#image').on('change', function(event){
  // console.log(event);
  var output = document.getElementById('ac_image');
  console.log(output);
  output.src = URL.createObjectURL(event.target.files[0]);
  output.style.display = "block";
});

// Get the modal zoom image
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('ac_image');
var modalImg = document.getElementById("img01");
// var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}