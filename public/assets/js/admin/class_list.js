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
function deleteClass(){
  
    if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
        showNotify('warning', 'Vui lòng chọn ít nhất một chi đoàn!');
    }else{
    
        var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
        var id = [];
        for(var i = 0; i< data.length; i++){
            id.push(data[i][1]);
        }
        alert(id);
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
            showNotify('error', 'Xóa chi đoàn thất bại!');
            console.log(this.url);
            console.log(error);
            console.log(xhr);
            console.log(status);
        });
    }
}