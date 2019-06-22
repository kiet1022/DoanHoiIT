@extends('admin.layout.layout')
@section('title','Thống kê sinh viên theo năm học')
@section('style')
<link href="{{asset('assets/css/admin/activity/workflow_list.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Thổng kê</li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Tình trạng sinh viên</li>
          </ol>
        </nav>
      </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Thống kê tình trạng sinh viên</h4>
    </div>
  </div>
  <div class="row custom_panel">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 p-0">
      <form action="" class="col-md-12" id="filterActivity">
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-4 offset-md-4">
            <label for="year" class="col-md-12 common-label-inline">Khóa học:</label>
            <div class="col-12 col-12 col-12 px-0 d-flex">
                <select name="year" id="year" class="form-control">
                    <option value="">Tất cả các khóa</option>
                  @foreach ($years as $y)
                  <option value="{{ $y->id }}" {!! changeSelectedStatus($y->id, old('year') ) !!}>{{ $y->course }}</option>
                  @endforeach
                </select>
              <div class="col-4">
                  <button type="button" class="btn btn-primary right" id="filter"><i class="fas fa-filter"></i> Lọc</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  
  <div class="row custom_panel">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 p-0 d-flex flex-wrap" id="chart-area">
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
<script>
  var k16 = @json($K16);
  var k15 = @json($K15);
  var k17 = @json($K17);
  var k18 = @json($K18);
  var classes = @json($classes);
  var years = @json($years);
  var BASE_URL = "{{ asset('admin/statistical/students/') }}";
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