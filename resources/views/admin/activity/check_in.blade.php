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
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('main_content')
  <div class="row">
    <div class="col page-title-header">
      <h4>Điểm danh</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_activity') }}" method="POST" class="col-md-12" id="filterActivity">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-4">
            <label for="year" class="col-md-4 common-label-inline">Năm học:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="year" id="year" class="form-control">
                <option value="{{ $year->name }}">{{ $year->name }}</option>
                {{-- @foreach ($year as $y)
                  
                  @endforeach --}}
                </select>
              </div>
            </div>
            
            {{-- Birthday --}}
            <div class="form-group col-md-4">
              <label for="activity" class="col-md-4 common-label-inline">Chương trình:</label>
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
            <div class="form-group col-md-4">
              <label for="type" class="col-md-4 common-label-inline">Hình thức:</label>
              <div class="col-md-8 col-sm-8 col-xs-8 px-0">
                <select name="type" id="type" class="form-control">
                  <option value="">Chọn hình thức điểm danh</option>
                  <option value="0">Điểm danh sinh viên tham gia</option>
                  <option value="1">Điểm danh BTC - CTV</option>
                </select>
              </div>
            </div>
            
          </div>
        </form>
      </div>
      {{-- Student list --}}
      <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <div class="row">
          <div class="col-md-4">
              <div class="card mb-4">
                  <div class="card-body">
                    <form action="#">
                      <div class="form-group">
                        <input type="number" class="form-control" id="inputsid" placeholder="Nhập MSSV sau đó nhấn Enter" min="1" max="99999999">
                      </div>
                    </form>
                  </div>
                </div>
          </div>
          <div class="col-md-8">
            <!-- Begin Page Content -->
            <div class="card mb-4">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
                    <thead style="background: #f8f9fc">
                      <tr>
                        <th>STT</th>
                        <th>MSSV</th>
                        <th>Tên Sinh viên</th>
                        <th>Thời gian checkin</th>
                      </tr>
                    </thead>
                    <tbody>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="text-right">
              <button class="btn btn-primary" id="saveinfo" onclick="saveCheckin()"><i class="fas fa-download"></i> Lưu danh sách điểm danh</button>
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
      var students = {!! $students !!};
    </script>
    <script src="{{asset('assets/js/admin/activity/check_in.js')}}"></script>
    @endsection