@extends('admin.layout.layout')
@section('title')
Danh sách sinh viên
@endsection
@section('style')
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/vendor/icheck-1.x/skins/flat/green.css')}}" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href="{{asset('assets/vendor/gijgo-combined-1.9.11/css/gijgo.min.css')}}" rel="stylesheet">
<style>
.no-js #loader { display: none;  }
    .js #loader { display: block; position: absolute; left: 100px; top: 0; }
    .se-pre-con {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background: url("{{asset('assets/img/Preloader_1.gif')}}") center no-repeat #fff;
    }</style>
@endsection
@section('main_content')
<div class="se-pre-con"></div>
<div class="row">
    <div class="col page-title-header">
        <h4>Nhập thông tin sinh viên</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form id="file" action="{{ route('post_import_student') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-6 offset-md-2">
                    <input type="file" name="importFile" id="importFile" class="form-control" style="height: auto;" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success cm-btn-form">Load</button>
                </div>
                
            </div>
            
        </form>
    </div>
    
    
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <div class="col-md-12 my-2">
            <a href="{{asset('templates/excel/template_import_student.xlsx')}}"><h5>Tải mẫu import</h5></a>
        </div>
        <iframe width="100%" style="min-height: calc(100vh - 400px)" frameborder="0" scrolling="no" src="https://onedrive.live.com/embed?resid=979DCCFAB98844F4%212499&authkey=%21AK9sqbtqlTwWLB4&em=2&wdAllowInteractivity=True"></iframe>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/vendor/icheck-1.x/icheck.js')}}"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="{{asset('assets/vendor/gijgo-combined-1.9.11/js/gijgo.js')}}"></script>

<script>
    var message = '';
    var type = '';
    @if(session('success'))
    message = '{{session('success')}}'
    type = 'success';
    @endif
    @if(session('error'))
    message = '{{session('error')}}'
    type = 'danger';
    @endif
    @if(session('success') || session('error'))
    $.notify({
        // options
        message: message,
    },{
        // settings
        type: type,
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


            $(document).on('submit','form#file',function(){
                //$(".se-pre-con").fadeOut("slow");
            });
        </script>
        <script src="{{asset('assets/js/admin/add_student.js')}}"></script>
        
        @endsection