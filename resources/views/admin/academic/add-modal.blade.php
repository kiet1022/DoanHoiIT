<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Thêm chương trình đào tạo</h5>
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
                                    <label for="type" class="col-md-2 common-label-inline">Thời gian đào tạo <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <select id="type" class="form-control col-md-2" name="type">
                                        <option value="2">2 năm</option>
                                        <option value="4">4 năm</option>
                                    </select>
                                </div> 
                                <div class="form-inline cm-inline-form">
                                    <label for="type" class="col-md-2 common-label-inline">Năm học <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <select id="start" class="form-control col-md-2" name="start">
                                        @for ($i =2000; $i <= 2050; $i++)
                                        <option value="{{$i}}" @if( date('Y') ==$i) {{"selected"}} @endif>{{ $i }}</option>
                                        @endfor  
                                    </select>
                                    <label class="col-md-1">  -  </label>
                                    <select id="end" class="form-control col-md-2" name="end">
                                        <option value="" >--</option>
                                    </select>
                                </div>
                                {{-- error --}}
                                @if ($errors->get('start'))
                                <div class="form-inline cm-inline-form cm-error">
                                    <ul class="col-md-8 offset-md-4 cm-ul-error">
                                        @foreach ($errors->get('start') as $start)
                                        <li>{{$start}}</li>
                                        @endforeach
                                    </ul>
                                </div>
                                @endif
                                <div class="form-inline cm-inline-form">
                                    <label for="course" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                    <input type="text" class="form-control col-md-8" id="course" name="course" placeholder="" required value="{{old('course')}}">
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
    var type = $('#type').val();
    var end = $('#end').val();
    var start = $('#start').val();
    var course = $('input[name=course]').val();

    blockUI(true);
    $.ajax({    
        url: BASE_URL + "/addProgram.php",
        method: 'POST',
        data:{
            type:type,
            end:end,
            start:start,
            course: course
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
        showNotify("error","Thêm loại tin thất bại!");
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
