$(document).ready(function(){

// init Toggle
$('[data-toggle="tooltip"]').tooltip();
// init editor
if(CKEDITOR) {
    CKEDITOR.replace('activityContent', {
        allowedContent: true
    });
    CKEDITOR.config.extraAllowedContent = 'audio[*]';
    CKEDITOR.config.height = 200;
    CKEDITOR.config.width = 350;
}

// init date picker
$('#startDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
});
$('#endDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
});
$('#startRegisDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
});
$('#endRegisDate').datepicker({
        format:'dd/mm/yyyy',
        language:'vi-VN', 
        autoHide:true,
        inline:true,
        autoPick: true
});

// Block UI when submit form
$(document).on('submit',"form", function(e){
        blockUI(true);
});
});