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

function getCurrentDateTime(){
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date+' '+time;
    return dateTime;
}