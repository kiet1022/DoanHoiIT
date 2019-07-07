@extends('admin.layout.layout')
@section('title')
Chỉnh sửa bài viết
@endsection
@section('style')
<link href="{{asset('assets/css/admin/cm-news.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
                <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý tin tức</li>
                <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('get_news_list') }}"> Danh sách tin tức</a></li>
                <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Sửa tin tức</li>
            </ol>
        </nav>
    </div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_new',['id'=>$news->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-group cm-inline-form">
                                <label for="type" class=" common-label-inline">Thể loại <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="type" class="form-control " name="type">
                                    @foreach ($newsType as $type)
                                    <option value="{!! $type->id !!}" @if($news->type_id == $type->id) {{"selected"}} @endif>{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group cm-inline-form">
                                <label for="title" class=" common-label-inline">Tiêu đề <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control " id="title" name="title" placeholder="" required value="{{$news->title}}">
                            </div>                     
                            <div class="form-group cm-inline-form">
                                <label for="sumary" class=" common-label-inline">Tóm tắt:</label>
                                <textarea class="form-control" id="sumary" name="sumary" style="margin-top: 0px; margin-bottom: 0px; height: 139px;">{{$news->sumary}}</textarea>
                            </div>
                            <div class="form-group cm-inline-form select-image">
                                <label  class=" common-label-inline">Hình ảnh nổi bật:</label>
                                <input type="file" name="image" id="image" onchange="loadFile(event)" accept='image/*' style="height: auto;" class="form-control">
                                @if($news->image != "") 
                                <img id="myImg" class="rounded image-new" src="{{asset('images/news')}}/{{$news->image}}" style="width: 30%; margin-top: 10px">
                                {{-- <button id="removeImage"  type="button" class=" classic_button_next btn btn-primary mt-2">Delete Image</button> --}}
                                <div class="form-group cm-inline-form" id="selectImage"></div>
                                @else
                                <img id="myImg" class="rounded image-new" style="width: 30%; margin-top: 10px; display: none;">
                                @endif
                                <div id="myModal" class="modal">
                                        <span class="close">&times;</span><!-- The Close Button -->
                                        <img class="modal-content" id="img01"><!-- Modal Content (The Image) -->
                                        <div id="caption"></div><!-- Modal Caption (Image Text) -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group cm-inline-form">
                                <label for="content_news" class="common-label-inline">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <textarea id="content_news" name="content_news">{{$news->content}}</textarea>
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
    // Get the modal zoom image
    var modal = document.getElementById('myModal');
    
    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById('myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
    
    // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks on <span> (x), close the modal
            span.onclick = function() { 
                modal.style.display = "none";
            }
        </script>
        <script src="{{asset('assets/js/admin/news.js')}}"></script>
        
        @endsection