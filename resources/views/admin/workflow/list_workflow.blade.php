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
                <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('get_list_activity') }}"> Danh sách chương trình</a></li>
                <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Tiến độ công việc</li>
            </ol>
        </nav>
    </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Tiến độ công việc</h4>
    </div>
  </div>
  <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
          <form action="{{ route('get_workflow_filter') }}" method="POST">
            @csrf
            <div class="form-row">
            {{-- Activity --}}
            <div class="form-group col-4 offset-md-4">
                <label for="activity" class="col-md-12 common-label-inline">Chương trình:</label>
                <div class="col-md-12 col-sm-12 col-xs-12 px-0 d-flex">
                  <select name="activity" id="activity" class="form-control col-md-8 col-sm-8 col-xs-8">
                    <option value="">Chọn chương trình</option>
                    @foreach ($activities as $a)
                    <option value="{{ $a->id }}" {!! changeSelectedStatus("$a->id", old('activity') ) !!} >{{ $a->name }}</option>
                    @endforeach
                  </select>
                  <button class="btn btn-primary ml-3" type="submit">Xem tiến độ</button>
                </div>
              </div>
            </div>
          </form>
        </div>
  </div>
  @if (isset($workflows))
    @if(count($workflows) > 0)
  <div class="row custom_panel">
    
    <div class="col-md-12 col-sm-12 col-xs-12 d-flex flex-wrap p-0" id="in-card-content">
      @foreach ($workflows as $workflow)
      <div class="col-4">
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
        </div>
      </div>
      @endforeach
    </div>
  </div>
    @else
    <div class="row custom_panel text-center">
        <div class="col-md-12 col-sm-12 col-xs-12 p-0" id="in-card-content">
          <span class="badge badge-warning">Chương trình này chưa được phân công công việc</span>
        </div>
    </div>
    @endif
  @endif
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