$(document).ready(function(){
})
// Init data table
var example = $('#dataTable').DataTable({
  columnDefs: [ {
    orderable: false,
    className: 'select-checkbox',
    targets:   0
  }, 
  { width: '10%', targets: 1 },
  { width: '40%', targets: 3 }],
  select: {
    style: 'multi',
    selector: 'td:first-child'
  },
});

$('.edit-roles').on('click', function(){
  var content = $(this).data('content')
  var html = '';
  html += '<input type="hidden" name="id" value="'+content.id+'">'
  html += '<div class="form-group">'
  html += '<label for="name">Tên quyền <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>'
  html += '<input class="form-control" type="text" name="name" id="name" placeholder="Nhập tên quyền" value="'+content.name+'" required>'
  html += '</div>'
  html += '<div class="form-group">'
  html += '<label for="description">Mô tả <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>'
  html += '<textarea class="form-control" name="description" id="description" cols="30" rows="10" required>'+content.description+'</textarea>'
  html += '</div>'
  $('#content-body').html(html);
  $('#editModal').modal('show');
});

$('form').on('submit', function(){
  blockUI(true);
});

// isUnion and UnionFee Toggle
$(function () {
  $('.toggleisUnion').bootstrapToggle({
    on: 'Có quyền',
    off: 'Không có quyền',
    onstyle: 'primary',
    style: 'back-ground-toggle'
  });
  $('#toggleisUnion_0').bootstrapToggle({
    on: 'Có quyền',
    off: 'Không có quyền',
    onstyle: 'primary',
    style: 'back-ground-toggle'
  });
})

$('#toggleisUnion_0').change(function () {
  var $input = $('.toggleisUnion');
  var toggle = $input.find('.toggleisUnion');
  
  if ($(this).prop('checked') == false) {
    $('.'+toggle.prevObject[0].classList[1]).bootstrapToggle('off');
  } else {
    $('.'+toggle.prevObject[0].classList[1]).bootstrapToggle('on');
  }
  
})