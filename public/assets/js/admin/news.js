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
    $(".newsSelected").on('click', function(event) {
        var id = $(this).attr('id');
        var checkBox = document.getElementById("ckb_"+id+"");

        var i=0;
        $( "tr.selected" ).each(function() {
            i++;
        });
        var j=0;
        $( "input[type=checkBox]" ).each(function() {
            if (this.checked) {
                j++;
            }     
        });

        if (false === event.ctrlKey) {
            if (checkBox.checked == false) {
                $("input.sub_chk").prop('checked',false );
            }else{
                $("input.sub_chk").prop('checked',false );
                if (i==0 && j!=0) {
                    $("#ckb_"+id+"").prop('checked', false); 
                }else if(i==1&&j==1){
                    $("#ckb_"+id+"").prop('checked', true); 
                }else if(i!=0){
                    $("#ckb_"+id+"").prop('checked', false); 
                }
            }
        }

        if(checkBox.checked == true)  {
            $("#ckb_"+id+"").prop('checked',false ); 
        } 
        else {  
            $("#ckb_"+id+"").prop('checked', true); 
        }  

    });
    //click button delete
    $('#deleteNews').on('click', function(e) {
        var allVals = [];  
        $(".sub_chk:checked").each(function() {  
            allVals.push($(this).attr('data-id'));
        });  
        if(allVals.length <=0)  
        {  
            alert("Chưa có sinh viên nào được chọn!");  
        }  
        else {  
            var check = confirm("Bạn có chắc muốn xóa những sinh viên này không?");  
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
    //click button delete
    $('#deleteNewsType').on('click', function(e) {
        var allVals = [];  
        $(".sub_chk:checked").each(function() {  
            allVals.push($(this).attr('data-id'));
        });  
        if(allVals.length <=0)  
        {  
            alert("Chưa có sinh viên nào được chọn!");  
        }  
        else {  
            var check = confirm("Bạn có chắc muốn xóa những sinh viên này không?");  
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