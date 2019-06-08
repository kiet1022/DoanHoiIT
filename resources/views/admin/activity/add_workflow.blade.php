@extends('admin.layout.layout')
@section('title','Tạo dự trù')
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
      <h4>Tiến độ công việc</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="#" method="post">
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-4">
            <label for="year" class="col-md-12 common-label-inline">Năm học:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="year" id="year" class="form-control">
                @foreach ($year as $y)
                <option value="{{ $y->name }}" {!! changeSelectedStatus($y->name, old('year') ) !!}>{{ $y->name }}</option>
                @endforeach
              </select>
            </div>
          </div>
          
          {{-- Birthday --}}
          <div class="form-group col-md-4">
            <label for="semester" class="col-md-12 common-label-inline">Học kỳ:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="semester" id="semester" class="form-control">
                <option value="">Chọn học kỳ</option>
                <option value="1" {!! changeSelectedStatus("1", old('semester') ) !!}>Kỳ 1</option>
                <option value="2" {!! changeSelectedStatus("2", old('semester') ) !!}>Kỳ 2</option>
              </select>
            </div>
          </div>
          
          {{-- Activity --}}
          <div class="form-group col-md-4">
            <label for="activity" class="col-md-12 common-label-inline">Chương trình:</label>
            <div class="col-md-8 col-sm-8 col-xs-8 px-0">
              <select name="activity" id="activity" class="form-control">
                <option value="">Chọn chương trình</option>
                @foreach ($activities as $a)
                <option value="{{ $a->id }}" {!! changeSelectedStatus("$a->id", old('activity') ) !!}>{{ $a->name }}</option>
                @endforeach
              </select>
            </div>
          </div>
          <div class="form-group col-md-2 offset-md-10">
            <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="row custom_panel">
    <form action="#">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 d-flex flex-wrap p-0" id="in-card-content">
      <div class="col-md-4 mb-4" id="card_0">
        <div class="card" style="box-shadow: 3px 4px 7px 1px rgba(209,209,209,1);">
          <div class="card-header">
            <div class="form-row">
              <div class="col-md-8">
                <h6 class="m-0 font-weight-bold text-primary">Phân công công việc</h6>
              </div>
              
              <div class="col-md-4">
                <button type="button" class="close mr-2 text-danger delete" data-delete="0"><i class="fas fa-minus" title="Xóa nội dung"></i></button>
                <button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>
              </div>
            </div>
          </div>
          <div class="card-body">
              <div class="form-row">
                <div class="form-group col-12">
                  <label for="student_0">Người đảm nhiệm <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                  <select name="student_[]" id="student_0" class="form-control">
                    <option value="">Chọn người đảm nhiệm</option>
                    @foreach ($students as $student)
                      <option value="{{ $student->student_id }}">{{ $student->name }}</option>
                    @endforeach
                  </select>
                </div>
                
                <div class="form-group col-12">
                  <label for="workname_0">Tên công việc <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                  <input type="text" class="form-control" id="workname_[]" name="workname_[]">
                </div>
                
                <div class="form-group col-12">
                  <label for="workcontent_0">Nội dung <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                  <textarea name="workcontent_[]" id="workcontent_0" rows="5" class="form-control"></textarea>
                </div>
                
                {{-- Ngày bắt đầu chương trình --}}
                <div class="form-group col-12">
                  <label for="deadline_0">Deadline <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                  <input style="width: inherit;" id="deadline_0" width="100%" class="form-control" name="deadline_[]" maxlength="10" required>
                </div>
              </div>
          </div>
        </div>
      </div>
      </div>
      <hr class="sidebar-divider d-none d-md-block m-0">
      <div class="text-center">
        <button type="submit" class="btn btn-success">submit</button>
      </div>
    </form>
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
    var BASE_URL = "{{ asset('admin/activities/funding') }}";
    @if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    showNotify('success',success);
    var url = "{{route('get_list_activity')}}"
    setTimeout("location.replace(url)", 500);
    @endif
    var student = {!!$students!!}
  </script>
  <script src="{{asset('assets\js\admin\activity\add_workflow.js')}}"></script>
  @endsection