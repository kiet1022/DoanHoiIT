<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Thêm loại tin</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4">
                            
                            <div class="card-body editDetail">
                                <div class="form-group">
                                    <label for="typename">Tên loại tin</label>
                                  <input type="text" name="typename" id="typename" class="form-control">
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
    var typename = $('input[name=typename]').val();

    blockUI(true);
    $.ajax({    
        url: BASE_URL + "/addType.php",
        method: 'POST',
        data:{
          typename: typename
        }
    }).done(function(data) {
        blockUI(false);
        // hide edit modal
        $('#formAddType').modal('hide');
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