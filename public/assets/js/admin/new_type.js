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
function deleteType(){
  
  if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
    showNotify('warning', 'Vui lòng chọn ít nhất một loại tin!');
  }else{
    var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
    var id = [];
    for(var i = 0; i< data.length; i++){
      id.push(data[i][1]);
    }
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
      showNotify('error', 'Xóa loại tin thất bại!');
      console.log(this.url);
      console.log(error);
      console.log(xhr);
      console.log(status);
    });
    
  }
}
$('#addType').on('click', function(){
    // alert('hello');
    $.ajax({
        url: BASE_URL + "/add.php",
    }).done(function(data) {
        console.log(data);
        $('#formAddType').html(data);
        $('#formAddType').modal('show');
    }).fail(function(xhr, status, error) {
        console.log('lala');
        console.log(this.url);
        console.log(error);
    });
});
$('#addType').on('click', function(){
    // alert('hello');
    $.ajax({
        url: BASE_URL + "/add.php",
    }).done(function(data) {
        console.log(data);
        $('#formAddType').html(data);
        $('#formAddType').modal('show');
    }).fail(function(xhr, status, error) {
        console.log('lala');
        console.log(this.url);
        console.log(error);
    });
});
$('#btnSave').on('click', function(){
    var name = $('input[name=name]').val();

    blockUI(true);
    $.ajax({    
        url: BASE_URL + "/addType.php",
        method: 'POST',
        data:{
          name: name
        }
    }).done(function(data) {
        blockUI(false);
        // hide edit modal
        $('#formAddType').modal('hide');
        console.log(data);
        // show notify
        showNotify(data.status, data.message);
        // wating 1 second then refresh page
        setTimeout("location.reload()", 1000);
    }).fail(function(xhr, status, error) {
        blockUI(false);
        showNotify("error","Thêm loại tin thất bại!");
        console.log(xhr);
        console.log(status);
        console.log(this.url);
        console.log(error);
    });
});