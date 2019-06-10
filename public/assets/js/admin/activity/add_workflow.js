$(document).ready(function(){
  console.log(student);
  checkCount();
  // init date picker
  initDateTimePicker();
});

function initDateTimePicker(){
  $('.deadline').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN', 
    autoHide:true,
    inline:true,
    autoPick: true
  });
}

var count = 1;
function checkCount(){
  $el = $(document).find(".delete");
  // check label remove detail
  if(count <= 1){
      $el.css('display','none');
  } else {
      $el.css('display','initial');
  }
  
  // check button
  if(count <= 0){
      $('#submit').css('display','none');
      $('#clear').css('display','none');
  } else {
      $('#submit').css('display','initial');
      $('#clear').css('display','initial');
  }
}
var i = 0;
// render more workflow
$(document).on('click','.add', function(e){
  i++;
  count += 1;
  html = '<div class="col-4 mb-4" id="card_'+i+'">';
  html+= '<div class="card" style="box-shadow: 3px 4px 7px 1px rgba(209,209,209,1);">'
    html+= '<div class="card-header">'
      html+= '<div class="form-row">'
        html+= '<div class="col-8">'
        html+= '<h6 class="m-0 font-weight-bold text-primary">Phân công công việc</h6>'
        html+= '</div>'
        
        html+= '<div class="col-4">'
          html+= '<button type="button" class="close mr-2 text-danger delete" data-delete="'+i+'"><i class="fas fa-minus" title="Xóa nội dung"></i></button>'
          html+= '<button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>'
        html+= '</div>'
      html+= '</div>'
    html+= '</div>'
    html+= '<div class="card-body">'
        html+= '<div class="form-row">'
          html+= '<div class="form-group col-12">'
            html+= '<label for="leader_'+i+'">Người đảm nhiệm <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>'
            html+= '<select name="leader_[]" id="leader_'+i+'" class="form-control" required>'
              html+= '<option value="">Chọn người đảm nhiệm</option>'
              student.forEach(element => {
                html += '<option value="'+element.student_id+'">'+element.name+'</option>'
              });
            html+= '</select>'
          html+= '</div>'
          
          html += '<div class="form-group col-12">'
            html += '<label for="workcontent_'+i+'">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>'
            html += '<textarea name="workcontent_[]" id="workcontent_'+i+'" rows="5" class="form-control"></textarea>'
          html += '</div>'
          
          html += '<div class="form-group col-12">'
            html += '<label for="deadline+'+i+'">Deadline <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>'
            html += '<input style="width: inherit;" id="deadline+'+i+'" width="100%" class="form-control deadline" name="deadline_[]" maxlength="10" required>'
          html += '</div>'
        html += '</div>'
    html += '</div>'
  html += '</div>'
html += '</div>'
  $('#in-card-content').append(html);
  checkCount();
  initDateTimePicker();
  console.log('count: '+count);
});

// Remove fund detail
$(document).on('click','.delete', function(){
  var el = $(this).data('delete');
  $("div").remove('#card_'+el);
  count -= 1;
  checkCount();
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

$('select[name=activity]').on('change', function(e){
  var val = $(this).val();
  if(val){
    $('#activityID').val(val);
  }
});

$('form').on('submit', function(e){
  var activity =  $('select[name=activity]').val();
  if(activity){
    blockUI(true);
  } else {
    showNotify('warning','Bạn chưa chọn chương trình.');
    e.preventDefault();
  }
  
});