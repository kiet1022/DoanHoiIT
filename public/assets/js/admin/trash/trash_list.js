$(document).ready(function(){
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  
});

function restoreTrash(){
  var action = $('select[name=action]').val();
  var data_id = [];
  // delete many
  var ids = $('#dataTable').DataTable().rows( {selected:  true} ).data();
  for(var i = 0; i< ids.length; i++){
    data_id.push(ids[i][1]);
  }
  if(data_id.length <= 0){
    showNotify('warning','Vui lòng chọn ít nhất một chương trình.');
  } else {
    restore(action,data_id);
  }
}

function restore(action, data){
  blockUI(true);
  $.ajax({
    url: BASE_URL + "/restore.php",
    method: 'POST',
    data:{
      'ids': data,
      'action': action
    }
  }).done(function(data) {
    blockUI(false);
    // redraw table after delete
    $('#dataTable').DataTable().rows( {selected:  true} ).remove().draw();
    showNotify(data.status,data.message);
  }).fail(function(xhr, status, error) {
    blockUI(false);
    showNotify('error','Khôi phục chương trình thất bại.');
    console.log(this.url);
    console.log(error);
  });
}

actionData('1');
function actionData(action){
  blockUI(true);
  $.ajax({
    url: BASE_URL + "/type.php",
    method: 'POST',
    data:{
      action: action
    }
  }).done(function(data) {
    console.log(data);
    // destroy old data table
    if($.fn.DataTable.isDataTable( '#dataTable' )){
      $('#dataTable').DataTable().destroy();
    }
    
    $('#dataTable').html(data);
    // init data table
    initTable();
    blockUI(false);
    //$('#studentDetail').modal('show');
  }).fail(function(xhr, status, error) {
    blockUI(false);
    console.log('lala');
    console.log(this.url);
    console.log(error);
  });
}

$('select[name=action]').change(function(){
  var action = $(this).val();
  actionData(action);
});

function initTable(){
  $('#dataTable').DataTable({
    columnDefs: [ {
      orderable: false,
      className: 'select-checkbox',
      targets:   0
    }],
    select: {
      style: 'multi',
      selector: 'td:first-child'
    },
  });
}