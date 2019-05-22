$(document).ready(function(){
   $.ajaxSetup({
      headers: {
         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
   });
   
   // Init data table
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
   
   // Check if no row selected
   var row = $('#dataTable').DataTable().rows('.selected').count();
   enableDeleteButton(row);
   
   // table row deselect event
   $('#dataTable').DataTable().on('deselect', function(e, dt, type, indexes){
      var row = $('#dataTable').DataTable().rows('.selected').count();
      console.log(row);
      enableDeleteButton(row);
   });
   
   // table row select event
   $('#dataTable').DataTable().on('select', function(e, dt, type, indexes){
      var row = $('#dataTable').DataTable().rows('.selected').count();
      console.log(row);
      enableDeleteButton(row);
   });
   
});

// Show student detail
$('.detailToggle').click(function(){
   blockUI(true);
   var id = $(this).data('id');
   
   $.ajax({
      url: BASE_URL + "/detail.php",
      method: 'POST',
      data:{
         id: id
      }
   }).done(function(data) {
      console.log(data);
      $('#activityDetail').html(data);
      $('#activityDetail').modal('show');
      blockUI(false);
   }).fail(function(xhr, status, error) {
      blockUI(false);
      console.log('lala');
      console.log(this.url);
      console.log(error);
   });
});

// block UI when submit form
$(document).on('submit',"form", function(e){
   blockUI(true);
});

// anable delete button 
function enableDeleteButton(row){   
   if(row <= 0){
      $('#deleteUser').css('display','none');
   } else {
      $('#deleteUser').css('display','inline-block');
   }
}
// Delete activity
function deleteActivity(){
   
   if($('#dataTable').DataTable().rows( {selected:  true} ).count() <= 0 ){
      showNotify('warning','Vui lòng chọn ít nhất một chương trình.')
   }else{
      // Block UI
      blockUI(true);
      var data = $('#dataTable').DataTable().rows( {selected:  true} ).data();
      var activity_id = [];
      for(var i = 0; i< data.length; i++){
         activity_id.push(data[i][1]);
      }
      
      $.ajax({
         url: BASE_URL + "/delete.php",
         method: 'POST',
         data:{
            'activity_id': activity_id
         }
      }).done(function(data) {
         blockUI(false);
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
}

$('.delete-fund-detail').on('click', function(){
   var activity = $(this).data('content');
   showDeleteWarning(activity);
});

function showDeleteWarning(activity){
   BootstrapDialog.show({
      type: BootstrapDialog.TYPE_DEFAULT,
      title: 'Chú ý! ',
      message: 'Bạn có chắc chắn muốn xóa dự trù của chương trình "'+ activity.name+'"?',
      buttons: [{
         label: 'Cancel',
         cssClass: 'btn-primary btn-sm',
         action: function(dialogRef){
            dialogRef.close();
         }
      },{
         label: 'Delete',
         cssClass: 'btn-danger btn-sm',
         action: function(dialogRef){
            dialogRef.close();
            deleteActivityFund(activity);
         }
      }]
   });    
}

function deleteActivityFund(activity){
   blockUI(true);
   $.ajax({
      url: BASE_FUNDING_URL + "/delete-activity-funding.php",
      method: 'POST',
      data:{
         'activityFundId': activity.fund.id
      }
   }).done(function(data) {
      showNotify(data.status,data.message);
      blockUI(false);
      // wating 1 second then refresh page
      setTimeout("location.reload()", 1000);
   }).fail(function(xhr, status, error) {
      blockUI(false);
      showNotify('error','Xóa dự trù thất bại!');
      console.log(this.url);
      console.log(error);
   });
}