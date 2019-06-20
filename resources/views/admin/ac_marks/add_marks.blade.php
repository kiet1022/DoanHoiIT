@extends('admin.layout.layout')
@section('title','Điểm danh chương trình')
@section('style')
<link href="{{asset('assets/css/admin/activity/list_activity.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="row">
  <div class="col page-title-header">
    <h4>Điểm danh</h4>
  </div>
</div>
<form action="{{ route('post_add_marks') }}" method="POST" id="myform">
  @csrf
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <div class="form-row">
        {{-- School year --}}
        <div class="form-group col-md-4">
          <label for="content" class="col-md-12 col-sm-12 col-xs-12 common-label-inline">Nội dung danh sách <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
          <div class="col-md-8 col-sm-8 col-xs-8 px-0">
            <input name="content" id="content" class="form-control" placeholder="Nhập nội dung danh sách điểm cộng" required>
          </div>
        </div>
        
        {{-- Activity --}}
        <div class="form-group col-md-4">
          <label for="type" class="col-md-12 col-sm-12 col-xs-12 common-label-inline">Loại điểm cộng <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
          <div class="col-md-8 col-sm-8 col-xs-8 px-0">
            <select name="type" id="type" class="form-control" required>
              <option value="">Chọn loại điểm</option>
              <option value="0">Điểm rèn luyện</option>
              <option value="1">Điểm CTXH</option>
            </select>
          </div>
        </div>
        
        {{-- Check in type --}}
        <div class="form-group col-md-4">
          <label for="marks" class="col-md-12 col-sm-12 col-xs-12 common-label-inline">Số điểm cộng <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
          <div class="col-md-8 col-sm-8 col-xs-8 px-0">
            <input type="number" name="marks" id="marks" class="form-control" placeholder="Nhập số điểm cộng" required>
          </div>
        </div>
      </div>
      
      <div class="form-row">
        {{-- error --}}
        @if ($errors->get('content'))
        <div class="form-group col-md-4 cm-inline-form cm-error">
          <ul class="col-md-8 cm-ul-error">
            @foreach ($errors->get('content') as $sid)
            <li>{{$sid}}</li>
            @endforeach
          </ul>
        </div>
        @endif
        
        {{-- error --}}
        @if ($errors->get('type'))
        <div class="form-group col-md-4 cm-inline-form cm-error">
          <ul class="col-md-8 cm-ul-error">
            @foreach ($errors->get('type') as $sid)
            <li>{{$sid}}</li>
            @endforeach
          </ul>
        </div>
        @endif
        
        {{-- error --}}
        @if ($errors->get('marks'))
        <div class="form-group col-md-4 cm-inline-form cm-error">
          <ul class="col-md-8 cm-ul-error">
            @foreach ($errors->get('marks') as $sid)
            <li>{{$sid}}</li>
            @endforeach
          </ul>
        </div>
        @endif
      </div>
      
      <div class="form-row">
        {{-- School year --}}
        <div class="form-group col-md-4">
          <label for="year" class="col-md-4 common-label-inline">Năm học:</label>
          <div class="col-md-8 col-sm-8 col-xs-8 px-0">
            <select name="year" id="year" class="form-control">
              <option value="{{ $year->name }}">{{ $year->name }}</option>
            </select>
          </div>
        </div>
        
        {{-- Activity --}}
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
        <input type="hidden" name="data" id="data">
      </div>
    </div>
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <div class="form-group">
                <input type="number" class="form-control" id="inputsid" placeholder="Nhập MSSV sau đó nhấn Enter" min="1" max="99999999">
              </div>
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
            <button class="btn btn-primary cm-btn-form" id="saveinfo" type="submit"><i class="fas fa-download"></i> Lưu danh sách điểm danh</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
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
<script>
  var BASE_URL = "{{ asset('admin/activities/') }}";
  var students = {!! $students !!};
  @if(session('error'))
  var error = "{{session('error')}}";
  showNotify('error',error);
@endif
@if(session('success'))
  var success = "{{session('success')}}";
  showNotify('success',success);
@endif
</script>
<script src="{{asset('assets/js/admin/ac_marks/add_marks.js')}}"></script>
@endsection