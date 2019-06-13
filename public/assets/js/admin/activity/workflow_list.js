

// Show student detail
$('.detail').click(function(){
  blockUI(true);
  var content = $(this).data('content');
  
  $.ajax({
    url: BASE_URL + "/detail.php",
    method: 'POST',
    data:{
      content: content
    }
  }).done(function(data) {
    console.log(data);
    $('#workflowDetail').html(data);
    $('#workflowDetail').modal('show');
    blockUI(false);
  }).fail(function(xhr, status, error) {
    blockUI(false);
    console.log('lala');
    console.log(this.url);
    console.log(error);
  });
});