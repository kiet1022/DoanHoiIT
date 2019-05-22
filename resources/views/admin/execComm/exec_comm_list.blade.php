@extends('admin.layout.layout')
@section('title')
Danh sách ban chấp hành
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Quản lý ban chấp hành</h4>
    </div>
  </div>
  <div class="row">
    
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      
    </div>
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      
      <!-- Begin Page Content -->      
      <!-- DataTales Example -->
      <div class="card mb-4">
        <div class="card-header py-3 text-center">
          <form action="{{ route('get_ec_list') }}" method="get">
            @csrf
            <div class="btn-group" role="group" aria-label="Basic example">
              <button type="submit" class="btn btn-primary" name="type" value="0">BCH Đoàn</button>
              <button type="submit" class="btn btn-primary" name="type" value="1">BCH Liên Chi hội</button>
              <button type="submit" class="btn btn-primary" name="type" value="2">Cộng tác viên</button>
            </div>
          </form>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead style="background: #f8f9fc">
                <tr>
                  <th>Hình ảnh</th>
                  <th>MSSV</th>
                  <th>Họ tên</th>
                  <th>Chức vụ</th>
                  <th>Giới tính</th>
                  <th>SDT Liên hệ</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach ($execComm as $list)
                <tr>
                  <td>
                      <img  src="{{ asset('assets/img/students/'.$list->ofStudent->image) }}" 
                      onError='this.onerror=null;this.src="{{ asset('assets/img/image-not-available.png') }}";' 
                      alt="Không có hình ảnh" style="max-width: -webkit-fill-available;display: -webkit-inline-box;">
                  </td>
                  <td>{{$list->student_id}}</td>
                  <td>{{$list->ofStudent->name}}</td>
                  <td class="text-center"> 
                    {!! changeLevelLabel($list->level, $commType) !!}
                  </td>
                  <td class="text-center">
                    {!! changeGenderForList($list->ofStudent->sex) !!}
                  </td>
                  <td>{{ $list->ofStudent->phone_no }}</td>
                  <td>
                    <a class="cm-label text-info detailToggle" data-id="{{$list->student_id}}" data-toggle="modal"><i class="fas fa-list" title="Chi tiết"></i></a>
                  <a class="cm-label text-info editToggle" data-id="{{$list->student_id}}" data-type="{{$commType}}" data-toggle="modal"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa"></i></a>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
      <a class="btn btn-success" href="{{route('get_ec_chart',["type"=>$commType])}}"><i class="fas fa-plus-circle"></i> Sơ đồ</a>
      
    </div>
  </div>
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#studentDetail1">
      Open modal
    </button>
</div>

<!-- Detail Modal -->
<div class="modal animated jackInTheBox" id="studentDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  
</div>


<!-- Edit Modal -->
<div class="modal animated jackInTheBox" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

</div>
  @endsection
  @section('js')
  <!-- Page level plugins -->
  <script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
  <script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
  <script src="{{ asset('assets/vendor/orgchart.js') }}"></script>
<script>
  var BASE_URL = "{{ asset('admin/student') }}"+"/";
var EXEC_URL = "{{ asset('admin/exec-com') }}"+"/";
</script>
  <script src="{{ asset('assets/js/admin/execComm/exec_comm_list.js') }}"></script>
  <!-- Page level custom scripts -->
  {{-- <script src="js/demo/datatables-demo.js"></script> --}}  
  @endsection