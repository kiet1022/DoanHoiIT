@extends('admin.layout.layout')
@section('title')
Thêm bài viết
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Thêm bài viết</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <!-- <div >  -->
        <form action="{{ route('post_add_new') }}" method="POST" enctype="multipart/form-data" >
            @csrf
            <div class="form-row">
                <div class="col-md-12 col-sm-12 col-xs-12 ">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Loại tin:</label>
                                <select id="type" class="form-control col-md-4" name="type">
                                    @foreach ($newsType as $type)
                                    <option value="{!! $type->id !!}" {{changeSelectedStatus("$type->id",old('type'))}}>{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="title" class="col-md-2 common-label-inline">Tiêu đề <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="title" name="title" placeholder="" required value="{{old('title')}}">
                            </div>                     
                            <div class="form-inline cm-inline-form">
                                <label for="sumary" class="col-md-2 common-label-inline">Tóm tắt:</label>
                                <textarea class="col-md-8"  id="sumary" name="sumary" style="margin-top: 0px; margin-bottom: 0px; height: 139px;"></textarea>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="content_news" class="col-md-2 common-label-inline">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <textarea id="content_news" name="content_news"></textarea>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label  class="col-md-2 common-label-inline">Hình ảnh nổi bật:</label>
                                <input type="file" name="image" id="image" onchange="loadFile(event)">
                                <img class="image-new" id="output"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="button" class="btn btn-secondary cm-btn-form" onclick="javascript:history.back()">Cancel</button>
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button> 
                <!-- <button id="btnSave" class="btn btn-success cm-btn-form">Submit</button> -->
            </div>
        </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/js/admin/news.js')}}"></script>
<script>
  var BASE_URL = "{{ asset('admin/news/') }}"
</script>
<script type="text/javascript">
    //replace textarea
    if(CKEDITOR) {
        CKEDITOR.replace('content_news', {
            allowedContent: true
        });
        CKEDITOR.config.extraAllowedContent = 'audio[*]';
        CKEDITOR.config.height = 350;
        CKEDITOR.config.width = 350;
    }
</script>
<!-- <script type="text/javascript">
    $('#btnSave').on('click', function(){
    blockUI(true);
    var url= BASE_URL + "/addNew.php";
    alert(url);
    $.ajax({    
        url: BASE_URL + "/addNew.php",
        method: 'POST',
        data:{
          sumary: sumary,
          content_news:content_news,
          title: title,
          type: type,
          image: image
        }
    }).done(function(data) {
        blockUI(false);
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
</script> -->

@endsection