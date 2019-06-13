@extends('admin.layout.layout')
@section('title','Tạo dự trù')
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/workflow_list.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<style>
        .input-icons span { 
            position: absolute; 
        } 
          
        .input-icons { 
            width: 100%; 
            margin-bottom: 10px; 
        } 
          
        .icon { 
            padding: 10px; 
            min-width: 40px; 
        } 
</style>
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Tiến độ công việc</h4>
    </div>
  </div>
  <div class="row">
  </div>
  <div class="row custom_panel">
    <form action="{{ route('post_add_workflow') }}" method="POST" class="col-12">
      @csrf
      <input type="hidden" name="activity" id="activityID">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 d-flex flex-wrap p-0" id="in-card-content">
      @foreach ($workflows as $workflow)
      <div class="col-4">
          {{-- style="background-image: url(../../../assets/img/unsplash.jpg)" --}}
          <div class="card" style="height: 100%">
            <div class="card-header">
                <h5 class="card-title" style="color:red;">{{ $workflow->ofStudent->name }}</h5>
            </div>
              <div class="card-body">
                <p class="card-text"><h4 class="text-primary">{{ $workflow->content }}</h4></p>
                <ul class="list-group list-group-flush">
                    @foreach ($workflow->details as $detail)
                    <li class="list-group-item">
                        {{ $detail->content }}
                        <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated {{ changeProgressbarColor($detail->progress) }}" role="progressbar" aria-valuenow="{{ $detail->progress }}" aria-valuemin="0" aria-valuemax="{{ $detail->progress }}" style='width:{{ $detail->progress}}%'>{{ $detail->progress }}%</div>
                        </div>
                    </li>
                    @endforeach
                  </ul>
              </div>

              <div class="card-footer  p-0">
                  <a href="#" class="btn btn-primary btn-sm detail" style="width:100%" data-content="{{$workflow}}"><i class="fas fa-edit"></i> Edit</a>
              </div>
            </div>
      </div>
      @endforeach
      </div>
    </form>
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
  <script>
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
  <script src="{{asset('assets\js\admin\activity\workflow_list.js')}}"></script>
  @endsection