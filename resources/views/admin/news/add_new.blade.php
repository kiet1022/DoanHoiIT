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
        <form action="{{ route('post_add_new') }}" method="POST" enctype="multipart/form-data" >
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Thể loại <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="type" class="form-control col-md-4" name="type">
                                    @foreach ($newsType as $type)
                                    <option value="{!! $type->id !!}" {{changeSelectedStatus("$type->id",old('type'))}}>{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="title" class="col-md-2 common-label-inline">Tiêu đề <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="title" name="title" placeholder="" required >
                            </div>                     
                            <div class="form-inline cm-inline-form">
                                <label for="sumary" class="col-md-2 common-label-inline">Tóm tắt:</label>
                                <textarea class="col-md-8" id="sumary" name="sumary" style="margin-top: 0px; margin-bottom: 0px; height: 139px;"></textarea>
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

@endsection