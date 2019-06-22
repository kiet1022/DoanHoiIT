@extends('admin.layout.layout')
@section('title')
Lịch sử hoạt động
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Lịch sử hoạt động</li>
      </ol>
    </nav>
  </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Lịch sử hoạt động</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_logs') }}" method="POST" class="col-md-12">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-inline cm-inline-form col-md-3 offset-md-3">
            <label for="beginDate" class="col-md-4 common-label-inline">Từ ngày:</label>
            <div class="col-md-8 px-0">
              <input style="width: inherit;" id="beginDate" width="100%" class="form-control" name="beginDate" maxlength="10" value="{{ old('beginDate') }}">
            </div>
          </div>
          
          {{-- Birthday --}}
          <div class="form-inline cm-inline-form col-md-3">
            <label for="endDate" class="col-md-4 common-label-inline">Đến ngày:</label>
            <div class="col-md-8 px-0">
              <input style="width: inherit;" id="endDate" width="100%" class="form-control" name="endDate" maxlength="10" value="{{ old('endDate') }}">
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
                  <th>MSSV</th>
                  <th>Họ Tên</th>
                  <th>Quyền</th>
                  <th>Hành động</th>
                  <th>Dữ liệu cũ</th>
                  <th>Dữ liệu mới</th>
                  <th>Thời gian thực hiện</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($logs as $log)
                <tr class="">
                  <td>{{$log->student_id}}</td>
                  <td>{{$log->student_name}}</td>
                  <td>{{$log->role}}</td>
                  <td>{{$log->action}}</td>
                  <td>{!! $log->old_data !!}</td>
                  <td>{!! $log->new_data !!}</td>
                  <td>{{date('d/m/Y H:i:s',strtotime($log->time_id))}}</td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
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
  @endsection
  @section('js')
  <!-- Page level plugins -->
  {{-- <script src="{{asset('assets/js/admin/common.js')}}"></script> --}}
  <script>
    var classes = {!!$class!!};
    var BASE_URL = "{{ asset('admin/student/') }}"
  </script>
  <!-- Page level custom scripts -->
  <script src="{{asset('assets/js/admin/logs.js')}}"></script>
  
  @endsection