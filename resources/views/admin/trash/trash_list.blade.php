@extends('admin.layout.layout')
@section('title')
Trash Bin
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/list_activity.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <div class="col page-title-header">
            <h4>Thùng rác</h4>
        </div>
    </div>
    <div class="row">
        {{-- basic filter condition --}}
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <form action="#" class="col-md-12">
                <div class="form-row">
                    
                    {{-- Birthday --}}
                    <div class="form-inline cm-inline-form col-md-4 offset-md-4">
                        <div class="col-md-8 col-sm-8 col-xs-8 px-0">
                            <select name="action" id="action" class="form-control" style="width:100%;">
                                <option value="1">Chương trình</option>
                                <option value="2">Sinh viên</option>
                                <option value="3">Tin tức</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
            </form>
        </div>
        {{-- Student list --}}
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <!-- Begin Page Content -->      
            <!-- DataTales Example -->
            <div class="card mb-4">
                {{-- <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Danh sách sinh viên</h6>
                </div> --}}
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover dataTable" id="dataTable" width="100%" cellspacing="0">
                        
                        </table>
                    </div>
                </div>
            </div>
            <button onclick="restoreTrash()" class="btn btn-primary btn-restore"><i class="fas fa-trash-restore"></i> Restore</button>
        </div>
    </div>
    {{-- Breadcrumb --}}
    <div class="col-md-12">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb cm-breadcrumb">
                <li class="breadcrumb-item"><a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><i class="fas fa-arrow-circle-left"></i> Quay lại</a></li>
                {{-- <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa thông tin</li> --}}
            </ol>
        </nav>
    </div>
<!-- Modal -->
<div class="modal animated jackInTheBox" id="activityDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

</div>
    @endsection
    @section('js')
    <!-- Page level plugins -->
    <script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
    <script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
    <script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
    <script>
        var BASE_URL = "{{ asset('admin/trash/') }}";
    </script>
    <script src="{{asset('assets/js/admin/trash/trash_list.js')}}"></script>
@endsection