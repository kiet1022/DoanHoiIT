@extends('admin.layout.layout')
@section('title', 'Dự trù kinh phí')
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
    background: url('../../../assets/img/details_open.png') no-repeat center center;
    cursor: pointer;
  }
  tr.shown td.details-control {
    background: url('../../../assets/img/details_close.png') no-repeat center center;
  }
  
  tr.shown>tr {
    background: #fff;
  }
</style>
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Dự trù kinh phí</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('filter_activity_fund') }}" method="POST" class="col-md-12" id="filterActivity">
        @csrf
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
                  <th>Chi tiết</th>
                  <th></th>
                  <th>Mã dự trù</th>
                  <th>Chương trình</th>
                  <th>Tổng kinh phí (dự kiến)</th>
                  <th>Thực chi</th>
                  <th>Trạng thái</th>
                  <th>Export danh sách</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach ($funds as $fund)
                <tr>
                <td></td>
                <td></td>
                <td>{!! $fund->details !!}</td>
                <td>{{ $fund->id }}</td>
                <td>{{ $fund->activity->name }}</td>
                <td>{{ number_format($fund->initial_funds) }} đ</td>
                <td>{{ number_format($fund->actual_funds) }} đ</td>
                <td class="text-center">{!! changePayedStatus($fund->status) !!}</td>
                <td></td>
                <td class="text-center">
                  <a href="{{ route('get_edit_activity_funding',['id'=>$fund->id]) }}" class="btn btn-primary btn-sm text-center"><i class="fas fa-edit" title="Chỉnh sửa dự trù" data-toggle="tooltip" data-placement="top"></i></a>
                </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <button onclick="deleteActivity()" class="btn" id="deleteFund" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa chương trình</button>
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
    var BASE_URL = "{{ asset('admin/activities/funding') }}";
  </script>
  <script src="{{asset('assets/js/admin/fund/list_activity_fund.js')}}"></script>
  @endsection