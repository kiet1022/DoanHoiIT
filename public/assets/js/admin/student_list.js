$(document).ready(function () {

    //click button delete
    $('.delete_all').on('click', function(e) {
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
                            alert(data['error']);
                        } else {
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

// Change class when school year change
$('#studentShoolYear').change(function(){
    var schoolYearId = $(this).val();
    changeClass(schoolYearId, classes);
})

// Change select class
function changeClass(schoolYearId, classes){
    var html = '';
    var clas = [];
    classes.find(function(item){
        if(item.school_year_id == schoolYearId){
            clas.push(item);
        }
    });

    for(var i = 0 ; i< clas.length; i++){
        html += '<option value="'+clas[i].id+'">'+clas[i].class_name+'</option>';
    }

    if(html != ''){
        $('#studentClass').html(html);
    }
}