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
  var type = $('#type').val();
  if(activityId != "" && type != ""){
    $('#saveinfo').css('display','inline-block');
    $('#inputsid').attr('placeholder','Nhập MSSV sau đó nhấn Enter');
    $('#inputsid').attr('readonly',false);
  } else {
    $('#saveinfo').css('display','none');
    $('#inputsid').attr('placeholder','Vui lòng chọn chương trình và hình thức điểm danh trước.');
    $('#inputsid').attr('readonly',true);
  }
  $('#inputsid').focus();
}

$('#activity').on('change', function(e){
  checkButtonSave();
});

$('#type').on('change', function(e){
  checkButtonSave();
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
var arr_attender = [];
var arr_collaborator = [];
var arr_organizers = [];

function dataTableAddRow(data){
    count++;
    var type = $('#type').val();
    if(type == "0"){
      arr_attender.push(data.student_id);
    } else if(type == "1"){
      arr_organizers.push(data.student_id);
    } else if(type == "2"){
      arr_collaborator.push(data.student_id);
    }

    table.row.add([
        count,
        data.student_id,
        data.name,
        getCurrentDateTime()
    ]).draw(false);
}

function dataTableAddRowNotExit(data){
    count++;
    var type = $('#type').val();
    if(type == "0"){
      arr_attender.push(data);
    } else if(type == "1"){
      arr_organizers.push(data);
    } else if(type == "2"){
      arr_collaborator.push(data);
    }

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
    var year = $('#year').val();
    if(activityId != "" && checkinType != ""){
      blockUI(true);
      $.ajax({
        url: BASE_URL + "/check-in/save.php",
        method: 'POST',
        data:{
            'activityId': activityId,
            'arr_attender': arr_attender,
            'arr_organizers': arr_organizers,
            'arr_collaborator':arr_collaborator,
            'checkinType': checkinType,
            'year': year
        }
    }).done(function(data) {
      console.log(data);
        showNotify(data.status,data.message);
        blockUI(false);
        clearArr(data.type);  
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
    } else if (checkinType == ""){
      showWarning('Vui lòng chọn hình thức điểm danh!');
    }
}

function clearArr(type){
  if(type == "0"){
    arr_attender = [];
  } else if(type == "1"){
    arr_organizers = [];
  } else if(type == "2"){
    arr_collaborator = [];
  }
}