@extends('admin.layout.layout')
@section('title')
Thêm bài viết
@endsection
@section('main_content')
<div class="row">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý tin tức</li>
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('get_news_list') }}"> Danh sách tin tức</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Thêm tin tức</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_add_new') }}" method="POST" enctype="multipart/form-data" >
            @csrf
            <div class="form-row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-group cm-inline-form">
                                <label for="type" class="common-label-inline">Thể loại <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="type" class="form-control" name="type">
                                    @foreach ($newsType as $type)
                                    <option value="{!! $type->id !!}" {{changeSelectedStatus("$type->id",old('type'))}}>{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group cm-inline-form">
                                <label for="title" class="common-label-inline">Tiêu đề <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control" id="title" name="title" placeholder="" required >
                            </div>                     
                            <div class="form-group cm-inline-form">
                                <label for="sumary" class="common-label-inline">Tóm tắt:</label>
                                <textarea class="form-control" id="sumary" name="sumary" style="margin-top: 0px; margin-bottom: 0px; height: 139px;"></textarea>
                            </div>
                            <div class="form-group cm-inline-form">
                                <label  class="common-label-inline">Hình ảnh nổi bật:</label>
                                <input  class="form-control col-12" type="file" name="image" id="image" onchange="loadFile(event)" style="height: auto;">
                            </div>
                            
                            <div class="form-group cm-inline-form justify-content-center">
                                <img id="output" class="rounded image-new" style="width: 30%; margin-top: 10px">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6"> 
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group cm-inline-form">
                                <label for="content_news" class="common-label-inline">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <textarea id="content_news" name="content_news"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="button" class="btn btn-secondary cm-btn-form" onclick="javascript:history.back()">Cancel</button>
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button> 
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/js/admin/news.js')}}"></script>
<script>
    var BASE_URL = "{{ asset('admin/news/') }}";
    @if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    showNotify('success',success);
    @endif
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