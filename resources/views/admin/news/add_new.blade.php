@extends('admin.layout.layout')
@section('title')
Thêm bài viết
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
        <h4>Thêm bài viết</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_add_new') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
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
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
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
<script src="{{asset('assets/js/admin/news.js')}}"></script>

@endsection