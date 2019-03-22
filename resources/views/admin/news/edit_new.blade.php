@extends('admin.layout.layout')
@section('title')
Thêm loại tin
@endsection
@section('style')
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/vendor/icheck-1.x/skins/flat/green.css')}}" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href="{{asset('assets/vendor/gijgo-combined-1.9.11/css/gijgo.min.css')}}" rel="stylesheet">
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Thêm loại tin</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_new',['id'=>$news->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-4 common-label-inline">Loại tin:</label>
                                <select id="type" class="form-control col-md-8" name="type">
                                    @foreach ($newsType as $type)
                                    <option value="{!! $type->id !!}" @if($news->type_id == $type->id) {{"selected"}} @endif>{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="title" class="col-md-4 common-label-inline">Tiêu đề <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="title" name="title" placeholder="" required value="{{$news->title}}">
                            </div>                     
                            <div class="form-inline cm-inline-form">
                                <label for="sumary" class="col-md-4 common-label-inline">Tóm tắt:</label>
                                <!-- <label for="sumary" >Tóm tắt:</label> -->
                                <textarea id="sumary" name="sumary">{{$news->sumary}}</textarea>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="content_news" class="col-md-4 common-label-inline">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <textarea id="content_news" name="content_news">{{$news->content}}</textarea>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label  class="col-md-4 common-label-inline">Hình ảnh nổi bật:</label>
                                <input type="file" name="image" id="image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
                <button id="clear" onclick="clearValue()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/vendor/icheck-1.x/icheck.js')}}"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="{{asset('assets/vendor/gijgo-combined-1.9.11/js/gijgo.js')}}"></script>
<script src="{{asset('assets/js/ckeditor/ckeditor.js')}}"></script>
<script>
    // global variable
    var classes = {!!$data["class"]!!};
    var province = {!! $data["province"]!!}
    var district = {!! $data["district"]!!}
    var ward = {!! $data["ward"]!!}
    var message = '';
    @if(session('success'))
    $.notify({
        // options
        message:'{{session('success')}}',
    },{
        // settings
        type: "success",
        newest_on_top: true,
        offset: {
            x: 20,
            y: 80
        },
        spacing: 10,
        z_index: 1031,
        delay: 4000,
        timer: 500,
        animate: {
            enter: 'animated flipInY',
            exit: 'animated flipOutX'
        },
        template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
            '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
            '<span data-notify="icon"></span> ' +
            '<span data-notify="title">{1}</span> ' +
            '<span data-notify="message">{2}</span>' +
            '<div class="progress" data-notify="progressbar">' +
                '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                '</div>' +
                '<a href="{3}" target="{4}" data-notify="url"></a>' +
                '</div>' 
            });
            @endif
</script>
<script>
    if(CKEDITOR) {
        CKEDITOR.replace('content_news', {
            allowedContent: true
        });
        CKEDITOR.config.extraAllowedContent = 'audio[*]';
        CKEDITOR.config.height = 350;
        CKEDITOR.config.width = 350;
    }

</script>
<script src="{{asset('assets/js/admin/add_student.js')}}"></script>

@endsection