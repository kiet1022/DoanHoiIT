$( document ).ready(function(){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('#inputsid').focus();
    checkButtonSave();

});
var first = true;
function checkButtonSave(){
  var activityId = $('#activity').val();
  if(activityId == ""){
    $('#saveinfo').css('display','none');
  } else {
    $('#saveinfo').css('display','inline-block');
  }
}

$('#activity').on('change', function(e){
  if(first){
    showWarning('Trong suốt quá trình điểm danh bạn <strong>không được thay đổi</strong> chương trình, hình thức điểm danh hoặc refresh lại trang, nếu thay đổi <strong>toàn bộ dữ liệu</strong> điểm danh sẽ mất.');
    first = false;
  } else {
    showWarning('đâsđâsd')
  }
  checkButtonSave();
});

$('#type').on('change', function(e){
  if(first){
    showWarning('Trong suốt quá trình điểm danh bạn <strong>không được thay đổi</strong> chương trình, hình thức điểm danh hoặc refresh lại trang, nếu thay đổi <strong>toàn bộ dữ liệu</strong> điểm danh sẽ mất.');
    first = false;
  }
});
// Init data table
var table = $('#dataTable').DataTable({
    columnDefs: [ {
        orderable: false
    }],
    order: [[ 0, 'desc' ]]
});
// Click button check Info when press Enter
$('#inputsid').on('keypress', function(e){
    if(e.keyCode == 13){        
        var student = students.find(function(item){
            return e.target.value == item.student_id;
        });
        
        if(student){
            dataTableAddRow(student);
            e.target.value = "";
            e.target.focus();
        } else {
            dataTableAddRowNotExit(e.target.value);
            e.target.value = "";
            e.target.focus();
        }
    }
});
var count = 0;
var arr_student = [];
function dataTableAddRow(data){
    count++;
    arr_student.push(data.student_id);
    console.log(arr_student);
    table.row.add([
        count,
        data.student_id,
        data.name,
        getCurrentDateTime()
    ]).draw(false);
}

function dataTableAddRowNotExit(data){
    count++;
    arr_student.push(data);
    console.log(arr_student);
    table.row.add([
        count,
        data,
        '<span style="color:red;">Không tồn tại thông tin sinh viên</span>',
        getCurrentDateTime()
    ]).draw(false);
}


function saveCheckin(){
    var activityId = $('#activity').val();
    var checkinType = $('#type').val();
    if(activityId != "" && arr_student.length > 0 && checkinType != ""){
      blockUI(true);
      $.ajax({
        url: BASE_URL + "/check-in/save.php",
        method: 'POST',
        data:{
            'activityId': activityId,
            'studentList': arr_student,
            'checkinType': checkinType
        }
    }).done(function(data) {
        showNotify(data.status,data.message);
        blockUI(false);
        arr_student = [];
        $('#inputsid').focus();
    }).fail(function(xhr, status, error) {
        blockUI(false);
        showNotify('error','Lưu danh sách thất bại!');
        $('#inputsid').focus();
        console.log(this.url);
        console.log(error);
    });
    } else if (activityId == ""){
      showWarning('Vui lòng chọn chương trình!');
    } else if (arr_student.length <= 0){
      showWarning('Danh sách điểm danh rỗng!');
    } else if (checkinType == ""){
      showWarning('Vui lòng chọn hình thức điểm danh!');
    }
}