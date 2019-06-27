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
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Đoàn phí</li>
          </ol>
        </nav>
      </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Thống kê đoàn phí</h4>
    </div>
  </div>
  <div class="row custom_panel">
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 p-0">
      <form action="{{ route('st_filter_union_fee') }}" class="col-md-12" id="filterActivity" method="POST">
        @csrf
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group col-md-4 offset-md-4">
            <label for="schoolyear" class="col-md-12 common-label-inline">Khóa học:</label>
            <div class="col-12 col-12 col-12 px-0 d-flex">
                <select name="schoolyear" id="schoolyear" class="form-control">
                  @foreach ($years as $y)
                  <option value="{{ $y->id }}" {!! changeSelectedStatus("$y->id", old('schoolyear') ) !!}>{{ $y->course }}</option>
                  @endforeach
                </select>
              <div class="col-4">
                  <button type="submit" class="btn btn-primary right" id="filter"><i class="fas fa-filter"></i> Lọc</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  
  <div class="row custom_panel">

      <div class="accordion col-12" id="accordionExample">
          <div class="card">
            <div class="card-header text-primary" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              <h5 class="mb-0 card-link">
                  Biểu đồ
              </h5>
            </div>
        
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">
                  <div class="col-md-12 col-sm-12 col-xs-12 p-0 d-flex flex-wrap" id="chart-area"></div>
              </div>
            </div>
          </div>


          <div class="card">
            <div class="card-header text-primary" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              <h5 class="mb-0 card-link">
                  Chi tiết
              </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                @if (count($students) > 0)
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead style="background: #f8f9fc">
                        <tr>
                          <th>MSSV</th>
                          <th>Họ Tên</th>
                          <th>Lớp</th>
                          <th>Giới tính</th>
                          <th>Ngày sinh</th>
                          <th>Tình trạng đoàn viên</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach ($students as $student)
                        <tr class="">
                          <td>{{$student->student_id}}</td>
                          <td>{{$student->name}}</td>
                          <td>{{$student->class->class_name}}</td>
                          <td>{!! changeGenderForList($student->sex) !!}</td>
                          <td>{{date('d/m/Y',strtotime($student->birthday))}}</td>
                          <td class="text-center">{!! changeUnionStatus($student->is_youth_union_member)!!}</td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                  </div>
                @else
                  <div class="text-center">
                      <span class="badge badge-warning">Không có sinh viên nợ đoàn phí</span>
                  </div>
                @endif
              </div>
            </div>
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
  var k15 = @json($K15);
  var detail = @json($chartdetail);
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
<script src="{{asset('assets\js\admin\statistical\st_union_fee.js')}}"></script>
@endsection