@extends('admin.layout.layout')
@section('title')
Danh sách đăng ký chương trình
@endsection
@section('style')
<style>
  td.details-control {
    background: url({{ asset('assets/img/details_open.png') }}) no-repeat center center;
    cursor: pointer;
  }
  tr.shown td.details-control {
    background: url({{ asset('assets/img/details_close.png') }}) no-repeat center center;
  }
  
  tr.shown>tr {
    background: #fff;
  }
</style>
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý chương trình</li>
        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh sách đăng ký chương trình</li>
      </ol>
    </nav>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_ac_attender_list') }}" method="POST" class="col-md-12" id="filterActivity">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-4">
            <label for="year" class="col-12 common-label-inline">Năm học:</label>
            <div class="col-8 px-0">
              <select name="year" id="year" class="form-control">
                <option value="">Chọn năm học</option>
                @foreach ($year as $y)
                <option value="{{ $y->name }}" 
                  @if (old('year'))
                  {{changeSelectedStatus($y->name, old('year'))}}
                  @endif>
                  {{ $y->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
            
            {{-- Birthday --}}
            <div class="form-group col-md-4">
              <label for="semester" class="col-12 common-label-inline">Học kỳ:</label>
              <div class="col-8 px-0">
                <select name="semester" id="semester" class="form-control">
                  <option value="">Chọn học kỳ</option>
                  <option value="1" 
                  @if (old('semester'))
                  {{changeSelectedStatus('1', old('semester'))}}
                  @endif>Kỳ 1</option>
                  <option value="2"
                  @if (old('semester'))
                  {{changeSelectedStatus('2', old('semester'))}}
                  @endif>Kỳ 2</option>
                </select>
              </div>
            </div>
            
            {{-- Month --}}
            <div class="form-group col-md-4">
              <label for="month" class="col-12 common-label-inline">Tháng:</label>
              <div class="col-8 px-0">
                <select name="month" id="month" class="form-control">
                  <option value="">Chọn Tháng</option>
                  @for ($i = 1; $i < 13; $i++)
                  <option value="{{ numberToStringMonth($i) }}" {{changeSelectedStatus(numberToStringMonth($i), old('month'))}}>Tháng {{ $i }}</option>
                  @endfor
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
                    <th></th>
                    <th>Mã chương trình</th>
                    <th>Tên chương trình</th>
                    <th>Thời gian diễn ra</th>
                    <th>Sinh viên đứng chính</th>
                    <th>Trạng thái</th>
                    <th>Số lượng đăng ký</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($activities as $activity)
                  <tr class="">
                    <td></td>
                    <td>{{ $activity->attenders }}</td>
                    <td>{{$activity->id}}</td>
                    <td>{{$activity->name}}</td>
                    <td>{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}</td>
                    <td>{{$activity->leadBy->name}} - {{$activity->leadBy->student_id}}</td>
                    <td class="text-center">{!! changeActivityStatus($activity->start_date, $activity->end_date) !!}</td>
                    <td>{{ $activity->max_regis_num }}</td>
                    <td>
                      @if ($activity->max_regis_num > 0)
                      <a href="{{ route('export_attender_list',['activity_id'=>$activity->id]) }}" class="btn btn-primary btn-sm">Xuất DS</a>
                      @endif
                    </td>
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
    <script>
      var BASE_URL = "{{ asset('admin/activities/') }}";
      var BASE_FUNDING_URL = "{{ asset('admin/activities/funding') }}";
    </script>
    <script src="{{asset('assets/js/admin/activity/list_activity_attender.js')}}"></script>
    @endsection