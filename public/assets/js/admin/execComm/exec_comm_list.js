$( document ).ready(function(){
    $('#dataTable').DataTable({
        columnDefs: [ {
            orderable: false,
            targets:   0
        } ],
        order: [[ 4, 'asc' ]],
        "pageLength": 25,
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng trên trang",
            "zeroRecords": "Không có dữ liệu.",
            "info": "Trang _PAGE_/_PAGES_",
            "infoEmpty": "Không tồn tại dữ liệu.",
            "infoFiltered": "(đã lọc từ _MAX_ bản ghi)",
            "search": "Tìm kiếm",
            "info": "Hiển thị _START_ - _END_ trên _TOTAL_ bản ghi.",
            "paginate": {
                "first":      "Trang đầu",
                "last":       "Trang cuối",
                "next":       "Trang kế tiếp",
                "previous":   "Trang trước"
            },
        }
    });
    
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});



// var BASE_URL = 'http://localhost:8080/DoanHoiIT/public/admin/student/';
// var EXEC_URL = 'http://localhost:8080/DoanHoiIT/public/admin/exec-com/'
// Show student detail
$('.detailToggle').on('click', function(){
    blockUI(true);
    var id = $(this).data('id');
    console.log(id);
    $.ajax({
        url: BASE_URL + "detail.php",
        method: 'POST',
        data:{
            id: id
        }
    }).done(function(data) {
        blockUI(false);
        console.log(data);
        $('#studentDetail').html(data);
        $('#studentDetail').modal('show');
    }).fail(function(xhr, status, error) {
        blockUI(false);
        console.log('lala');
        console.log(this.url);
        console.log(error);
    });
});

// Show edit modal
$('.editToggle').on('click', function(){
    blockUI(true);
    var id = $(this).data('id');
    var type = $(this).data('type');
    console.log(id);
    console.log(type);
    $.ajax({    
        url: EXEC_URL + "edit.php",
        method: 'POST',
        data:{
            id: id,
            type: type
        }
    }).done(function(data) {
        blockUI(false);
        $('#editModal').html(data);
        $('#editModal').modal('show');
    }).fail(function(xhr, status, error) {
        blockUI(false);
        console.log('lala');
        console.log(this.url);
        console.log(error);
    });
});
// disable button save when focus input sid
$(document).on('focus','input[name=sid]', function(){
    // disable button save
    $('#btnSave').attr('disabled',true);
});

// Click button check Info when press Enter
$(document).on('keypress','input[name=sid]', function(e){
    if(e.keyCode == 13){
        $('#checkInfo').click();
    }
});

// Check info execComm
$(document).on('click','#checkInfo', function(){
    var id = $('input[name=sid]').val();
    blockUI(true);
    $.ajax({    
        url: EXEC_URL + "check.php",
        method: 'POST',
        data:{
            id: id
        }
    }).done(function(data) {
        blockUI(false);
        updateModal(data);
    }).fail(function(xhr, status, error) {
        blockUI(false);
        console.log('lala');
        console.log(this.url);
        console.log(error);
    });
});

// update modal édit exec Comm
function updateModal(data){

    if(data["execComm"] != null){
        console.log(data["execComm"]);
        $('input[name=sid]').val(data["execComm"].student_id);
        $('.name').html(data["execComm"].name).css("color","#6e707e");
        $('.class_name').html(data["execComm"].class.class_name).css("color","#6e707e");
        $('.staddress').html(data["execComm"].address).css("color","#6e707e");
        $('.imgExec>img').attr("src","http://localhost:8080/DoanHoiIT/public/assets/img/students/"+data["execComm"].image);
        $('.imgExec>img').attr("onerror","this.onerror=null;this.src='http://localhost:8080/DoanHoiIT/public/assets/img/image-not-available.png';");
        $('.imgExec>img').css("max-width", "webkit-fill-available");
        
        // enable button save
        $('#btnSave').attr('disabled',false);
    } else {
        $('.name').html('Sinh viên không tồn tại!').css("color","red");
        $('.class_name').html('Sinh viên không tồn tại!').css("color","red");
        $('.staddress').html('Sinh viên không tồn tại!').css("color","red");
        $('.imgExec>img').attr("src","http://localhost:8080/DoanHoiIT/public/assets/img/image-not-available.png");
        $('.imgExec>img').css("max-width", "webkit-fill-available");
        // disable button save
        $('#btnSave').attr('disabled',true);
    }
}

// Handle save new exec Comm
$(document).on('click', '#btnSave', function(){
    var newId = $('input[name=sid]').val();
    var oldId = $(this).data('id');
    var type = $(this).data('type');
    console.log("type: "+type);
    console.log("oldId: "+oldId);
    console.log("newId: "+newId);
    
    blockUI(true);
    $.ajax({    
        url: EXEC_URL + "save-info.php",
        method: 'POST',
        data:{
            oldId: oldId,
            newId: newId,
            type: type
        }
    }).done(function(data) {
        blockUI(false);
        // hide edit modal
        $('#editModal').modal('hide');
        console.log(data);
        // show notify
        showNotify(data.status, data.message);
        // wating 1 second then refresh page
        setTimeout("location.reload()", 1000);
    }).fail(function(xhr, status, error) {
        blockUI(false);
        showNotify("error","Lưu thông tin thất bại!");
        console.log(xhr);
        console.log(status);
        console.log(this.url);
        console.log(error);
    });
});