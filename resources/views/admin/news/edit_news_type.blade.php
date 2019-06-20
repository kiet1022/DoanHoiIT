@extends('admin.layout.layout')
@section('title')
Danh mục tin tức
@endsection
@section('style')
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Chỉnh sửa thể loại</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_news_type',['id'=>$newsType->id]) }}" method="POST">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">   
                            <div class="form-inline cm-inline-form">
                                <label for="typename" class="col-md-4 common-label-inline">Tên thể loại <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="typename" name="typename" placeholder="" required value="{{$newsType->name}}">
                            </div> 
                            
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="button" class="btn btn-secondary cm-btn-form" onclick="javascript:history.back()">Cancel</button>
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
                <button id="clear" onclick="clearValue()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script>
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
        <script src="{{asset('assets/js/admin/add_student.js')}}"></script>
        @endsection