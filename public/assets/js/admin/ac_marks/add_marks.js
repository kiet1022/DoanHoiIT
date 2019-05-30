$( document ).ready(function(){
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  
});
// Init data table
var table = $('#dataTable').DataTable({
  columnDefs: [ {
    orderable: false
  }],
  order: [[ 0, 'desc' ]]
});


$('form').on('keypress', function(e){
  var key = e.charCode || e.keyCode || 0;     
  if (key == 13) {
    e.preventDefault();
  }
});

// block UI when submit form
$(document).on('submit',"form", function(e){
  blockUI(true);
});

var arrData = [];
var count = 0;
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
    $('#data').val(arrData);
    console.log($('#data').val())
  }
});

function dataTableAddRow(data){
  count++;
  arrData.push(data.student_id);
  table.row.add([
    count,
    data.student_id,
    data.name,
    getCurrentDateTime()
  ]).draw(false);
}

function dataTableAddRowNotExit(data){
  count++;
  arrData.push(data);
  table.row.add([
    count,
    data,
    '<span style="color:red;">Không tồn tại thông tin sinh viên</span>',
    getCurrentDateTime()
  ]).draw(false);
}


// function refreshPage(){

// }

// window.onbeforeunload = function(e){
//   BootstrapDialog.show({
//     type: BootstrapDialog.TYPE_DEFAULT,
//     title: 'Chú ý! ',
//     message: 'Tất cả dữ liệu điểm danh sẽ mất khi refresh trang.',
//     buttons: [{
//       label: 'Cancel',
//       cssClass: 'btn-primary btn-sm',
//       action: function(dialogRef){
//         dialogRef.close();
//       }
//     },{
//       label: 'OK',
//       cssClass: 'btn-primary btn-sm',
//       action: function(dialogRef){
//         dialogRef.close();
//         e.preventDefault();
//         window.location.reload();
//       }
//     }]
//   });		
// }