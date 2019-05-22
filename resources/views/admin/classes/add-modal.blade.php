<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Thêm chi đoàn</h5>
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
                                    <select id="schoolYear" class="form-control col-md-4" name="schoolYear">
                                        @foreach ($schoolYear as $list)
                                        <option value="{{$list->id}}" >{{$list->name}}  ||  {{$list->course}}</option>
                                        @endforeach
                                    </select>
                                </div> 
                                <div class="form-inline cm-inline-form">
                                    <label for="name" class="col-md-2 common-label-inline">Tên chi đoàn <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <input type="text" class="form-control col-md-8" id="name" name="name" placeholder="" required value="{{old('name')}}">
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" class="btn btn-primary" style="width: 100%" >Lưu</button>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $('#btnSave').on('click', function(){
    var schoolYear = $('#schoolYear').val();
    var name = $('input[name=name]').val();

    blockUI(true);
    $.ajax({    
        url: BASE_URL + "/add-class.php",
        method: 'POST',
        data:{
            schoolYear:schoolYear,
            name:name
        }
    }).done(function(data) {
        blockUI(false);
        // hide edit modal
        $('#formAdd').modal('hide');
        console.log(data);
        // show notify
        showNotify(data.status, data.message);
        // wating 1 second then refresh page
        setTimeout("location.reload()", 1000);
    }).fail(function(xhr, status, error) {
        blockUI(false);
        showNotify("error","Thêm chi đoàn thất bại!");
        console.log(xhr);
        console.log(status);
        console.log(this.url);
        console.log(error);
    });
});
</script>
<script type="text/javascript">
    var val = $("#type option:selected").val();
    var start = $("#start option:selected").val();
    var yearEnd=parseInt(start)+parseInt(val);
    var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
    $("#end").html(str);
    $('#start').change(function() {
        var val = $("#type option:selected").val();
        var start = $("#start option:selected").val();
        var yearEnd=parseInt(start)+parseInt(val);
        var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
        $("#end").html(str);
    });
    $('#type').change(function() {
        var val = $("#type option:selected").val();
        var start = $("#start option:selected").val();
        var yearEnd=parseInt(start)+parseInt(val);
        var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
        $("#end").html(str);
    });
</script>
