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

//var BASE_URL = 'http://localhost:8080/DoanHoiIT/public/admin/student/';

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

// Show student detail
$('.detailToggle').on('click', function(){
  blockUI(true);
  var id = $(this).data('id');
  
  $.ajax({
    url: BASE_URL + "/detail.php",
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

// Delete student
function deleteStudent(){
  
  if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
    $.notify({
      // options
      title:'<h4><i class="fas fa-exclamation-circle"></i> Warning!!!</h4>',
      message:'Vui lòng chọn ít nhất một sinh viên.',
    },{
      // settings
      type: "warning",
      newest_on_top: true,
      offset: {
        x: 20,
        y: 20
      },
      spacing: 10,
      z_index: 1031,
      delay: 4000,
      timer: 500,
      animate: {
        enter: 'animated flipInY',
        exit: 'animated flipOutX'
      },
      template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
      '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
      '<span data-notify="icon"></span> ' +
      '<span data-notify="title">{1}</span> ' +
      '<span data-notify="message">{2}</span>' +
      '<div class="progress" data-notify="progressbar">' +
      '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
      '</div>' +
      '<a href="{3}" target="{4}" data-notify="url"></a>' +
      '</div>' 
    });
  }else{
    
    // Block UI
    $.blockUI({ message: '<div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status"><span class="sr-only">Loading...</span></div>', 
    css: {backgroundColor: 'transparent',border: 'none'} });
    
    var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
    var student_id = [];
    for(var i = 0; i< data.length; i++){
      student_id.push(data[i][1]);
    }
    
    $.ajax({
      url: BASE_URL + "/delete.php",
      method: 'POST',
      data:{
        'student_id': student_id
      }
    }).done(function(data) {
      blockUI(false);
      $('#dataTable').DataTable().rows( {selected:  true} ).remove().draw();
      showNotify(data.status, data.message);

    }).fail(function(xhr, status, error) {
      
      blockUI(false);
      showNotify('error', 'Xóa sinh viên thất bại!');
      console.log(this.url);
      console.log(error);
      console.log(xhr);
      console.log(status);
    });
    
  }
}