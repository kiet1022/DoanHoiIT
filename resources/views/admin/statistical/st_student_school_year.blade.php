@extends('admin.layout.layout')
@section('title','Thống kê sinh viên theo năm học')
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/workflow_list.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<link rel="stylesheet" href="{{ asset('assets\vendor\Chart.js-2.8.0\dist\Chart.min.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Thống kê sinh viên theo năm học</h4>
    </div>
  </div>
  <div class="row custom_panel">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 p-0">
      
    </div>
  </div>
  
  <div class="row custom_panel">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 p-0 d-flex flex-wrap">
      <div class="col-6 mb-3">
          <canvas id="myChart1" height="120"></canvas>
      </div>
      
      <div class="col-6 mb-3">
          <canvas id="myChart2" height="120"></canvas>
      </div>
      
      <div class="col-6 mb-3">
          <canvas id="myChart3" height="120"></canvas>
      </div>
      
      <div class="col-6 mb-3">
          <canvas id="myChart4" height="120"></canvas>
      </div>
    </div>
  </div>
</div>
{{-- Breadcrumb --}}
<div class="col-12">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb cm-breadcrumb">
      <li class="breadcrumb-item"><a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><i class="fas fa-arrow-circle-left"></i> Quay lại</a></li>
      {{-- <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa thông tin</li> --}}
    </ol>
  </nav>
</div>
<!-- Modal -->
<div class="modal animated jackInTheBox" id="workflowDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  
</div>
@endsection
@section('js')
<!-- Page level plugins -->
<script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
<script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
<script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
<script src="{{ asset('assets\vendor\Chart.js-2.8.0\dist\Chart.min.js') }}"></script>
<script>
  var k15 = @json($K15);
  var k16 = @json($K16);
  var k17 = @json($K17);
  var k18 = @json($K18);
  var BASE_URL = "{{ asset('admin/activities/workflow') }}";
  @if(session('error'))
  var error = "{{session('error')}}";
  showNotify('error',error);
  @endif
  @if(session('success'))
  var success = "{{session('success')}}";
  showNotify('success',success);
  @endif
</script>
<script src="{{asset('assets\js\admin\statistical\st_student_school_year.js')}}"></script>
@endsection