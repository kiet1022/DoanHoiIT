//load preview image
var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
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
    //click button delete
    $('#deleteProgram').on('click', function(e) {
        var allVals = [];  
        $(".sub_chk:checked").each(function() {  
            allVals.push($(this).attr('data-id'));
        });  
        if(allVals.length <=0)  
        {  
            alert("Chưa có chương trình đào tạo nào được chọn!");  
        }  
        else {  
            var check = confirm("Bạn có chắc muốn xóa những chương trình đào tạo này không?");  
            if(check == true){  
                var join_selected_values = allVals.join(","); 
                $.ajax({
                    url: $(this).data('url'),
                    type: 'DELETE',
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    data: 'ids='+join_selected_values,
                    success: function (data) {
                        if (data['success']) {
                            $(".sub_chk:checked").each(function() {  
                                $(this).parents("tr").remove();
                            });
                            alert(data['success']);
                        } else if (data['error']) {
                            alert('1');
                            alert(data['error']);
                        } else {
                            alert('2');
                            alert('Có lỗi xảy ra!!');
                        }
                    },
                    error: function (data) {
                        alert('3');
                        console.log(data.responseText);
                        alert(data.responseText);
                    }
                });
                $.each(allVals, function( index, value ) {
                    $('table tr').filter("[data-row-id='" + value + "']").remove();
                });
            }  
        }  
    });
});