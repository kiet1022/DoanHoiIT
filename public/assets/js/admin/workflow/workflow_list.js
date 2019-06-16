$(document).ready(function(){
  checkCount();
});
var count = 1;
// Show student detail
$('.detail').click(function(){
  blockUI(true);
  var content = $(this).data('content');
  count = content.details.length;
  count == 0 ? count = 1 : count = count;
  console.log(count);
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
    checkCount();
    blockUI(false);
  }).fail(function(xhr, status, error) {
    blockUI(false);
    console.log('lala');
    console.log(this.url);
    console.log(error);
  });
});

var i = 1000;
$(document).on('click','.add', function(e){
    i++;
    count += 1;
    var html = '';
    html+='<li class="list-group-item" id="card_'+i+'">'
    html+='<div class="form-row">'
        html+='<div class="form-group cm-inline-form col-md-7">'
            html+='<label for="content_'+i+'">Tên</label>'
            html += '<input type="hidden" name="workflowId_[]" value="0">'
            html+='<input id="content_'+i+'" class="form-control" type="text" name="content_[]">'
        html+='</div>'

        html+='<div class="form-group cm-inline-form col-md-4">'
            html+='<label for="progress_'+i+'">Tiến độ (%)</label>'
              html+='<input id="progress_'+i+'" class="form-control" type="number" name="progress_[]">'
        html+='</div>'

        html+='<div class="form-group cm-inline-form col-md-1 text-right">'
            html+='<a class="add mr-1 text-success"><i class="fas fa-plus"></i></a>'
            html+='<a class="delete text-danger" data-delete="'+i+'"><i class="fas fa-minus "></i></a>'
        html+='</div>'
      html+='</div>'
    html+='</li>'
    $('#detail-content').append(html);
    checkCount();
});

$(document).on('click','.delete', function(){
  var el = $(this).data('delete');
  $("li").remove('#card_'+el);
  count -= 1;
  console.log(count);
  checkCount();
});

function checkCount(){
  $el = $(document).find(".delete");
  // check label remove detail
  if(count <= 1){
      $el.css('display','none');
  } else {
      $el.css('display','initial');
  }
  
  // check button
  // if(count <= 0){
  //     $('#submit').css('display','none');
  //     $('#clear').css('display','none');
  // } else {
  //     $('#submit').css('display','initial');
  //     $('#clear').css('display','initial');
  // }
}

// block UI when submit form
$(document).on('submit',"form", function(e){
  console.log('aaa');
  blockUI(true);
});