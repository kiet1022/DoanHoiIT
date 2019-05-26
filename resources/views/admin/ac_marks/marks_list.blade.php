@extends('admin.layout.layout')
@section('title', 'Điểm rèn luyện - CTXH')
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/list_activity.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<style>
td.details-control {
    background: url('../../assets/img/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('../../assets/img/details_close.png') no-repeat center center;
}</style>
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Điểm rèn luyện - CTXH</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_activity') }}" method="POST" class="col-md-12" id="filterActivity">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-3">
            <label for="year" class="col-md-12 common-label-inline">Năm học:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="year" id="year" class="form-control">
                @foreach ($year as $y)
                <option value="{{ $y->name }}">{{ $y->name }}</option>
                @endforeach
              </select>
            </div>
          </div>
          
          {{-- Birthday --}}
          <div class="form-group col-md-3">
            <label for="semester" class="col-md-12 common-label-inline">Học kỳ:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="semester" id="semester" class="form-control">
                <option value="">Chọn học kỳ</option>
                <option value="1">Kỳ 1</option>
                <option value="2">Kỳ 2</option>
              </select>
            </div>
          </div>

          {{-- Activity --}}
          <div class="form-group col-md-3">
            <label for="activity" class="col-md-12 common-label-inline">Chương trình:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="activity" id="activity" class="form-control">
                <option value="">Chọn chương trình</option>
                @foreach ($activities as $a)
                <option value="{{ $a->id }}">{{ $a->name }}</option>
                @endforeach
              </select>
            </div>
          </div>

          {{-- Birthday --}}
          <div class="form-group col-md-3">
            <label for="semester" class="col-md-12 common-label-inline">Loại điểm:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="semester" id="semester" class="form-control">
                <option value="">Chọn Loại điểm</option>
                <option value="1">Điểm rèn luyện</option>
                <option value="2">Điểm CTXH</option>
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
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td>dddd</td>
                  <td>dddd</td>
                  <td>dddd</td>
                  <td>dddd</td>
                  <td>dddd</td>
                </tr>
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
  {{-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> --}}
  <script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
  <script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
  <script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
  <script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
  <script>
    var BASE_URL = "{{ asset('admin/activities/') }}";
    var BASE_FUNDING_URL = "{{ asset('admin/activities/funding') }}";
  </script>
  <script src="{{asset('assets/js/admin/ac_marks/marks_list.js')}}"></script>
  @endsection