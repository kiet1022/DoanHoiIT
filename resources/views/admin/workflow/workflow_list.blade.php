@extends('admin.layout.layout')
@section('title','Tiến độ công việc')
@section('style')
<link href="{{asset('assets/css/admin/activity/workflow_list.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
                <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý chương trình</li>
                <li class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="{{ route('get_list_activity') }}"> Danh sách chương trình</a></li>
                <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Tiến độ công việc chương trình {{ $workflows[0]->ofActivity->name }}</li>
            </ol>
        </nav>
    </div>
  {{-- <div class="row">
    <div class="col page-title-header">
      <h4>Tiến độ công việc chương trình {{ $workflows[0]->ofActivity->name }}</h4>
    </div>
  </div> --}}
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
                <p class="card-text"><h5 class="text-primary">{{ $workflow->content }}</h5></p>
                <ul class="list-group list-group-flush">
                    @foreach ($workflow->details as $detail)
                    <li class="list-group-item">
                        {{ $detail->content }}
                        <div class="progress">
                        <div class="progress-bar {{ changeProgressbarColor($detail->progress) }}" role="progressbar" aria-valuenow="{{ $detail->progress }}" aria-valuemin="0" aria-valuemax="{{ $detail->progress }}" style='width:{{ $detail->progress}}%'>{{ $detail->progress }}%</div>
                        </div>
                    </li>
                    @endforeach
                  </ul>
              </div>
              <div class="card-footer">
                  @if ($workflow->student_id === Auth::user()->student->student_id)
                  <div class="d-flex m-1">
                      <a href="#" class="btn btn-primary btn-sm detail mr-1" style="width:50%" data-content="{{$workflow}}"><i class="fas fa-edit"></i> Chỉnh sửa</a>
                      <a href="{{ route('delete_workflow',['id'=>$workflow->id])}}" class="btn btn-danger btn-sm ml-1" style="width:50%" "><i class="fas fa-minus"></i> Xóa</a>
                  </div>
                  @endif
              </div>

              {{-- <div class="card-footer  p-0 d-flex">
                  
              </div> --}}
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
  <script src="{{asset('assets\js\admin\workflow\workflow_list.js')}}"></script>
  @endsection