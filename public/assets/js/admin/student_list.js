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
    var id = $(this).data('id');
    
    $.ajax({
      url: "{{ route('get_student_detail') }}",
      method: 'GET',
      data:{
        'id': id
      }
    }).done(function(data) {
      console.log(data);
      $('#studentDetail').html(data);
      $('#studentDetail').modal('show');
    }).fail(function(xhr, status, error) {
      console.log(this.url);
      console.log(error);
    });
  });