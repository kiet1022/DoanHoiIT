$( document ).ready(function(){
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  
  // Check if no row selected
  var row = $('#dataTable').DataTable().rows('.selected').count();
  enableDeleteButton(row);
  
  // table row deselect event
  $('#dataTable').DataTable().on('deselect', function(e, dt, type, indexes){
    var row = $('#dataTable').DataTable().rows('.selected').count();
    enableDeleteButton(row);
  });
  
  // table row select event
  $('#dataTable').DataTable().on('select', function(e, dt, type, indexes){
    var row = $('#dataTable').DataTable().rows('.selected').count();
    enableDeleteButton(row);
  });
});
// Init data table
var table = $('#dataTable').DataTable({
  columnDefs: [ {
    orderable: false,
    className: 'details-control',
    targets:   1,
  },{
    "targets": [ 2 ],
    "visible": false,
    "searchable": false
  },{
    orderable: false,
    className: 'select-checkbox',
    targets:   0
  }],
  select: {
    style: 'multi',
    selector: 'td:first-child'
  },
});

function format (data) {
  var count = 0;
  // `d` is the original data object for the row
  var html = '<table table-bordered table-striped table-hover cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" id="table-detail">';
  html += '<thead>';
  html += '<tr><th>STT</th><th>Nội dung</th><th>Đơn vị tính</th><th>Đơn giá</th><th>Số lượng</th><th>Thành tiền</th><th>Thực chi</th><th>Hình thức thanh toán</th></tr>';
  html += '</thead>';
  html += '<tbody>';
  
  data.forEach(element => {
    count ++;
    html += '<tr>';
    html += '<td>'+count+'</td>';
    html += '<td>'+element.content+'</td>';
    html += '<td>'+element.unit+'</td>';
    html += '<td>'+numberFormat(element.unit_price)+'</td>';
    html += '<td>'+element.amount+'</td>';
    html += '<td>'+numberFormat(element.expected_value)+'</td>';
    html += '<td>'+numberFormat(element.actual_value)+'</td>';
    html += '<td>'+element.payment_type+'</td>';
    html += '</tr>';
  });
  html += '</tbody>';
  html += '</table>';
  return html;
}

// Add event listener for opening and closing details
$('#dataTable tbody').on('click', 'td.details-control', function () {
  var tr = $(this).closest('tr');
  var row = table.row( tr );
  var data = JSON.parse(row.data()[2]);
  if ( row.child.isShown() ) {
    // This row is already open - close it
    row.child.hide();
    tr.removeClass('shown');
  }
  else {
    row.child(format(data)).show();
    $('#table-detail').DataTable();
    tr.addClass('shown');
  }
} );

// anable delete button 
function enableDeleteButton(row){
  if(row <= 0){
    $('#deleteFund').css('display','none');
  } else {
    $('#deleteFund').css('display','inline-block');
  }
}

// Delete activity
function deleteActivity(){
  
  if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
    showNotify('warning','Vui lòng chọn ít nhất một chương trình.')
  }else{
    BootstrapDialog.show({
      type: BootstrapDialog.TYPE_DEFAULT,
      title: 'Chú ý! ',
      message: 'Thao tác này sẽ xóa tất cả các nội dung liên quan đến chương trình bao gồm dự trù. Tiếp tục?',
      buttons: [{
        label: 'Cancel',
        cssClass: 'btn-primary btn-sm',
        action: function(dialogRef){
          dialogRef.close();
        }
      },{
        label: 'OK',
        cssClass: 'btn-danger btn-sm',
        action: function(dialogRef){
          dialogRef.close();
          // Block UI
          blockUI(true);
          var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
          var fund_id = [];
          for(var i = 0; i< data.length; i++){
            fund_id.push(data[i][3]);
          }
          
          $.ajax({
            url: BASE_URL + "/delete.php",
            method: 'POST',
            data:{
              'fund_id': fund_id
            }
          }).done(function(data) {
            blockUI(false);
            console.log(data);
            // redraw table after delete
            $('#dataTable').DataTable().rows( {selected:  true} ).remove().draw();
            showNotify(data.status,data.message);
          }).fail(function(xhr, status, error) {
            blockUI(false);
            showNotify('error','Xóa chương trình thất bại.');
            console.log(this.url);
            console.log(error);
          }); 
        }
      }]
    });
    
  }
}

$('form').on('submit', function(){
  blockUI(true);
});

// Load activity by year
$('select[name=year]').on('change', function(){
  var year = $(this).val();
  var semester = $('select[name=semester]').val()
  $.ajax({
      url: BASE_URL + "/load-activities.php",
      method: 'POST',
      data:{
          'year': year,
          'semester': semester
      }
  }).done(function(data) {
      // redraw select
      redraw(data[0]);
  }).fail(function(xhr, status, error) {
      showNotify('error','Khôi phục chương trình thất bại.');
      console.log(this.url);
      console.log(error);
  });
});

// Load activity by year
$('select[name=semester]').on('change', function(){
  var year = $('select[name=year]').val();
  var semester = $(this).val();
  $.ajax({
      url: BASE_URL + "/load-activities.php",
      method: 'POST',
      data:{
          'year': year,
          'semester': semester
      }
  }).done(function(data) {
      // redraw select
      redraw(data[0]);
  }).fail(function(xhr, status, error) {
      showNotify('error','Khôi phục chương trình thất bại.');
      console.log(this.url);
      console.log(error);
  });
});

function redraw(data){
  var htmlActivity = '<option value="">Chọn chương trình</option>';
  for(var i = 0; i< data.length; i++){
      htmlActivity += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
  }
  $('select[name=activity]').html(htmlActivity);
}