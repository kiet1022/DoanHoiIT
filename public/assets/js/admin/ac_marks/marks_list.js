$( document ).ready(function(){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});
// Init data table
var table = $('#dataTable').DataTable({
    columnDefs: [ {
        orderable: false,
        className: 'details-control',
        targets:   0,
    },{
        "targets": [ 1 ],
                "visible": false,
                "searchable": false
    }]
});

function format (data) {
    var count = 0;
    // `d` is the original data object for the row
    var html = '<table table table-bordered table-striped table-hover cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" id="table-detail">';
        html += '<thead><tr><th colspan="3">Danh sách</th></tr><tr><th>STT</th><th width="150">MSSV</th><th width="250">Họ Tên</th></tr></thead>';
        html += '<tbody>';
                
        data.forEach(element => {
            count++;
            html += '<tr>';
            html += '<td>'+count+'</td>';
            html += '<td>'+element.student_id+'</td>';
            if(element.of_student != null){
                html += '<td>'+element.of_student.name+'</td>';
            } else {
                html += '<td>Chưa có thông tin</td>';
            }
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
    var data = JSON.parse(row.data()[1]);
    if ( row.child.isShown() ) {
        // This row is already open - close it
        row.child.hide();
        tr.removeClass('shown');
    }
    else {
    row.child(format(data)).show();
    $('td', row).css('background-color', 'blue');
    $('#table-detail').DataTable();
    tr.addClass('shown');
    }
} );