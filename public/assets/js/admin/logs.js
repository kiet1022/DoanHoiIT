$(document).ready(function () {
    
    // Init data table
    $('#dataTable').DataTable({
        order: [[ 6, 'desc' ]]
    });
    
    // beginDate picker
    $('#beginDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
        
    });
    
    // endDate picker
    $('#endDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
    });
})

// get curent date
var curday = function(sp){
    today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //As January is 0.
    var yyyy = today.getFullYear();
    
    if(dd<10) dd='0'+dd;
    if(mm<10) mm='0'+mm;
    return (dd+sp+mm+sp+yyyy);
};

// Block UI when submit form
$("form").on('submit', function(e){
    blockUI(true);
});