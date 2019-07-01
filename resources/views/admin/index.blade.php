@extends('admin.layout.layout')
@section('title')
Dashboard
@endsection
@section('style')

@endsection
@section('main_content')
<div class="se-pre-con"></div>
<!-- Content Row -->
<div class="row">
  
  <!-- Quản lý sinh viên-->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Quản lý sinh viên</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_student_list') }}" class="text-gray-800"> Danh sách sinh viên</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{route('get_add_student')}}" class="text-gray-800"> Thêm sinh viên</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-users fa-2x text-primary"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Quản lý chương trình</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_list_activity') }}" class="text-gray-800"> Danh sách chương trình</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_add_activity') }}" class="text-gray-800"> Thêm chương trình</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_check_in') }}" class="text-gray-800"> Điểm danh</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_workflow_list')}}" class="text-gray-800"> Tiến độ công việc</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_add_workflow',['id'=>'null']) }}" class="text-gray-800"> Phân công công việc</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-tasks fa-2x text-success"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Quản lý ĐRL - CTXH</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_marks_list') }}" class="text-gray-800"> Danh sách điểm</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-award fa-2x text-info"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Pending Requests Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-warning shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Quản lý thành viên ban chấp hành</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{route('get_ec_list')}}" class="text-gray-800"> Danh sách BCH</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-users-cog fa-2x text-warning"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- Thống kê-->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Thống kê</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('st_student_school_year') }}" class="text-gray-800"> Tình trạng sinh viên</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-chart-pie fa-2x text-primary"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Quản lý tin tức</div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_news_type_list') }}" class="text-gray-800"> Danh sách loại tin</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_add_new_type') }}" class="text-gray-800"> Thêm loại tin</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_news_list') }}" class="text-gray-800"> Danh sách bài đăng</a>
            </div>
            <div class="mb-0 font-weight-bold">
                <i class="far fa-hand-point-right"></i><a href="{{ route('get_add_new') }}" class="text-gray-800"> Thêm bài đăng</a>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-newspaper fa-2x text-success"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</div>


<!-- Content Row -->

<div class="row">
  
  <!-- Area Chart -->
  <div class="col-12">
    <div class="card shadow mb-4">
      <!-- Card Header - Dropdown -->
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Các chương trình trong tháng</h6>
      </div>
      <!-- Card Body -->
      <div class="card-body">
        {{-- <h4 class="small font-weight-bold">Các chương trình trong tháng</h4> --}}
        <div class="table-responsive">
          <table class="table table-bordered table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
            <thead style="background: #f8f9fc">
              <tr>
                <th>Mã CT</th>
                <th>Tên chương trình</th>
                <th>Sinh viên đứng chính</th>
                <th>Thời gian diễn ra</th>
                <th>Số lượng đăng ký</th>
                <th>Tiến độ</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($activities as $activity)
              <tr class="">
                <td>{{ $activity->id }}</td>
                <td>{{ $activity->name }}</td>
                <td>{{$activity->leadBy->name}} - {{$activity->leadBy->student_id}}</td>
                <td>{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}</td>
                <td>{{ $activity->max_regis_num }}</td>
                <td>
                  @if (  count($activity->workflows) != 0)
                        @php
                            $percent = 0;
                            foreach ($activity->workflows as $wfl) {
                              $percent += $wfl->progress;
                            }
                        @endphp
                  <div class="row flex-wrap">
                      <div class="col-12">
                          {{-- <h4 class="small font-weight-bold">Tiến độ<span class="float-right">{{ intval($percent) }}%</span></h4> --}}
                          <div class="progress">
                          {{-- <div class="progress-bar {{ changeProgressbarColor($percent) }}" role="progressbar" aria-valuenow="{{ intval($percent) }}" aria-valuemin="0" aria-valuemax="{{ intval($percent) }}" style='width:{{ intval($percent)}}%'>{{ intval($percent) }}%</div> --}}
                          </div>
                      </div>
                  </div>
                  @else
                  {{-- <h4 class="small font-weight-bold">Tiến độ<span class="float-right">{{ intval($percent) }}%</span></h4> --}}
                  <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="0" style='width:0%'>0%</div>
                  </div>
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
@endsection
@section('js')
  <script src="{{asset('assets/js/admin/index.js')}}"></script>
@endsection