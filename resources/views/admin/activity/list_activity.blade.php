@extends('admin.layout.layout')
@section('title')
Danh sách chương trình
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/list_activity.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<style>
  /* Bootstrap4 Dialog */
  .bootstrap-dialog-header {
    width: 100%;
  }
  
  .bootstrap-dialog-footer-buttons button {
    margin-left: 5px;
    margin-right: 5px;
  }
</style>
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Danh sách chương trình</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_activity') }}" method="POST" class="col-md-12" id="filterActivity">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-inline cm-inline-form col-md-3 offset-md-3">
            <label for="year" class="col-md-3 common-label-inline">Năm học:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="year" id="year" class="form-control" style="width:150px;">
                <option value="">Chọn năm học</option>
                @foreach ($year as $y)
                <option value="{{ $y->name }}">{{ $y->name }}</option>
                @endforeach
              </select>
            </div>
          </div>
          
          {{-- Birthday --}}
          <div class="form-inline cm-inline-form col-md-3">
            <label for="semester" class="col-md-3 common-label-inline">Học kỳ:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="semester" id="semester" class="form-control" style="width:150px;">
                <option value="">Chọn học kỳ</option>
                <option value="1">Kỳ 1</option>
                <option value="2">Kỳ 2</option>
              </select>
            </div>
          </div>
          
        </div>
        <div class="form-group col-md-2 offset-md-10">
          <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
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
            <table class="table table-bordered table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
              <thead style="background: #f8f9fc">
                <tr>
                  <th></th>
                  <th>Mã chương trình</th>
                  <th>Tên chương trình</th>
                  <th>Thời gian diễn ra</th>
                  <th>Sinh viên đứng chính</th>
                  <th>Trạng thái</th>
                  <th>Số lượng đăng ký</th>
                  <th>Chương trình</th>
                  <th>Dự trù</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($activities as $activity)
                <tr class="">
                  <td></td>
                  <td>{{$activity->id}}</td>
                  <td>{{$activity->name}}</td>
                  <td>{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}</td>
                  <td>{{$activity->leadBy->name}} - {{$activity->leadBy->student_id}}</td>
                  <td class="text-center">{!! changeActivityStatus($activity->start_date, $activity->end_date) !!}</td>
                  <td>{!! "0" !!}</td>
                  <td class="text-center">
                      <a class="cm-label text-info detailToggle" data-id="{{$activity->id}}" data-toggle="modal"><i class="fas fa-list" title="Chi tiết"></i></a>
                      <a href="{{ route('get_edit_activity',['id'=>$activity->id]) }}"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa"></i></a>
                    </td>
                  <td class="text-center">
                    @if($activity->fund == null)
                    <a href="{{ route('get_add_activity_funding',['id'=>$activity->id]) }}" class="btn btn-info btn-sm">Tạo dự trù</a>
                    @else
                    <a href="{{ route('get_edit_activity_funding',['id'=>$activity->fund->id]) }}" class="btn btn-primary btn-sm" data-id="{{$activity->id}}"><i class="fas fa-edit cm-label text-white" title="Chỉnh sửa dự trù"></i> Sửa</a>
                    <a href="#" class="btn btn-danger btn-sm delete-fund-detail" data-content="{{$activity}}"><i class="fas fa-trash-alt cm-label text-white" title="Xóa dự trù"></i> Xóa</a>
                    @endif
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <a class="btn btn-success" href="{{route('get_add_activity')}}"><i class="fas fa-plus-circle"></i> Thêm chương trình</a>
      <button onclick="deleteActivity()" class="btn" id="deleteUser" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa chương trình</button>
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
    var BASE_URL = "{{ asset('admin/activities/') }}";
    var BASE_FUNDING_URL = "{{ asset('admin/activities/funding') }}";
  </script>
  <script src="{{asset('assets/js/admin/activity/list_activity.js')}}"></script>
  @endsection