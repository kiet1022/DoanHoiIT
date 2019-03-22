var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
};
if(CKEDITOR) {
    CKEDITOR.replace('content_news', {
        allowedContent: true
    });
    CKEDITOR.config.extraAllowedContent = 'audio[*]';
    CKEDITOR.config.height = 350;
    CKEDITOR.config.width = 350;
}

$("#removeImage").on('click', function(event) {
        var r = confirm("Bạn có chắc muốn xóa ảnh nổi bật của tin này?");
        if (r == true) {
            $("#myImg").remove();
            $("#removeImage").remove();
            $("#selectImage").html('<input type="file" name="image" id="image" onchange="loadFile(event)"><input type="hidden" name="imgDelF" id="imgDelF" > <br><img class="image-new" id="output"/>');
            $("#imgDelF").val('1');
        } 
    });


// Get the modal
    var modal = document.getElementById('myModal');

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById('myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
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