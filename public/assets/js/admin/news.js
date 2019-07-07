//load preview image
var loadFile = function(event) {
    var output = document.getElementById('myImg');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.style.display = "block";
};

//click delete current img
$("#removeImage").on('click', function(event) {
    var r = confirm("Bạn có chắc muốn xóa ảnh nổi bật của tin này?");
    if (r == true) {
        $("#myImg").remove();
        $("#removeImage").remove();
        $("#selectImage").html('<input type="file" name="image" id="image" onchange="loadFile(event)"><input type="hidden" name="imgDelF" id="imgDelF" > <br><img class="image-new" id="output"/>');
        $("#imgDelF").val('1');
    } 
});

$(document).ready(function () {
  
    $.ajaxSetup({
        headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $('#dataTable').DataTable({
        columnDefs: [ {
            orderable: false,
            className: 'select-checkbox',
            targets:   0
        } ],
        select: {
            style: 'multi',
            selector: 'td:first-child'
        },
        order: [[ 1, 'asc' ]]
    });

});

// Delete type
function deleteNew(){
  
    if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
        showNotify('warning', 'Vui lòng chọn ít nhất một bài viết!');
    }else{
    
        var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
        var id = [];
        for(var i = 0; i< data.length; i++){
            id.push(data[i][1]);
        }
        blockUI(true);
        $.ajax({
            url: BASE_URL + "/delete.php",
            method: 'POST',
            data:{
            'id': id
            }
        }).done(function(data) {
            blockUI(false);
            
            $('#dataTable').DataTable().rows( {selected:  true} ).remove().draw();
            showNotify(data.status, data.message);
        }).fail(function(xhr, status, error) {
            blockUI(false);
            showNotify('error', 'Xóa bài viết thất bại!');
            console.log(this.url);
            console.log(error);
            console.log(xhr);
            console.log(status);
        });
    }
}
