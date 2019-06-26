<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Sửa chi đoàn</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4">
                            
                            <div class="card-body editDetail">
                                <div class="form-inline cm-inline-form">
                                    <label for="schoolYear" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <select disabled id="schoolYear" class="form-control col-md-4" name="schoolYear">
                                        <option value="{{$class->school_year_id}}" >{{$class->schoolYear->name}} ||  {{$class->schoolYear->course}}</option>
                                    </select>
                                </div> 
                                <div class="form-inline cm-inline-form">
                                    <label for="name" class="col-md-2 common-label-inline">Tên chi đoàn <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <input type="text" class="form-control col-md-8" id="name" name="name" placeholder="" required value="{{$class->class_name}}">
                                </div>     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" data-id="{{ $class->id }}" class="btn btn-primary" style="width: 100%" >Lưu</button>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $('#btnSave').on('click', function(){
    var name = $('input[name=name]').val();
    var id = $(this).data('id');
    blockUI(true);
    $.ajax({    
        url: BASE_URL + "/save-class.php",
        method: 'POST',
        data:{
            name:name,
            id: id
        }
    }).done(function(data) {
        blockUI(false);
        // hide edit modal
        $('#formEdit').modal('hide');
        console.log(data);
        // show notify
        showNotify(data.status, data.message);
        // wating 1 second then refresh page
        setTimeout("location.reload()", 1000);
    }).fail(function(xhr, status, error) {
        blockUI(false);
        showNotify("error","Sửa chi đoàn thất bại!");
        console.log(error);
        console.log(name+"id: "+id);
    });
});
</script>
