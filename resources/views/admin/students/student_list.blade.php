@extends('admin.layout.layout')
@section('title')
Danh sách sinh viên
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">

<meta name="csrf-token" content="{{ csrf_token() }}">
<style>
  .no-js #loader { display: none;  }
  .js #loader { display: block; position: absolute; left: 100px; top: 0; }
  .se-pre-con {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url("{{asset('assets/img/Preloader_1.gif')}}") center no-repeat #fff;
  }
</style>
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Quản lý sinh viên</h4>
    </div>
  </div>
  <div class="row">
    {{-- filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="" method="get" class="col-md-12">
        <div class="form-row">
          <div class="form-group col-md-5">
            <label for="studentShoolYear" class="col-md-4 common-label-inline">Niên khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
            <select id="studentShoolYear" class="form-control col-md-6" name="studentShoolYear" required>
              @foreach ($data["schoolYears"] as $sy)
              <option value="{{$sy->id}}">{{$sy->course}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-group col-md-5">
            <label for="studentClass" class="col-md-4 common-label-inline">Lớp <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
            <select id="studentClass" class="form-control col-md-6" name="studentClass" required>
              @foreach ($data["class"] as $sy)
              <option value="{{$sy->id}}">{{$sy->class_name}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-group align-self-center col-md-2">
            <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
          </div>
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
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead style="background: #f8f9fc">
                <tr>
                  <th></th>
                  <th>MSSV</th>
                  <th>Họ Tên</th>
                  <th>Khóa</th>
                  <th>Lớp</th>
                  <th>Giới tính</th>
                  <th>Ngày sinh</th>
                  <th>Tình trạng</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach ($studentList as $list)
                <tr class="">
                  <td id="{{$list->student_id}}" class="column-selected"><input disabled="" type="checkbox" class="sub_chk hidden" data-id="{{$list->student_id}}"id="ckb_{{$list->student_id}}"></td>
                  <td>{{$list->student_id}}</td>
                  <td>{{$list->name}}</td>
                  <td>{{$list->schoolYear->course}}</td>
                  <td>{{$list->class->class_name}}</td>
                  <td>{!! changeGenderForList($list->sex) !!}</td>
                  <td>{{$list->birthday}}</td>
                  <td class="text-center">{!! changeStudyStatus($list->is_study)!!}</td>
                  <td class="text-center">
                    <a href=""><i class="fas fa-list cm-label text-info" title="Chi tiết" data-id="{{$list->student_id}}"></i></a>
                    <a href="{{ route('get_edit_student',['id'=>$list->student_id]) }}"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa"></i></a>
                    <a href=""><i class="fas fa-trash cm-label text-danger" title="Xóa" data-id="{{$list->student_id}}"></i></a>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
      <a class="btn btn-success" href="{{route('get_add_student')}}"><i class="fas fa-plus-circle"></i> Thêm 1 sinh viên</a>
      <a class="btn btn-info" href="{{ route('get_import_student') }}"><i class="fas fa-file-import"></i> Import Sinh viên</a>
      <button data-url="{{ url('deleteSelectedUser') }}" class="btn delete_all" id="deleteUser" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> <!-- route('delete_user',['id'=>$us->id]) -->
    </div>
  </div>
</div>
@endsection
@section('js')
<!-- Page level plugins -->
<script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
<!-- Page level custom scripts -->
{{-- <script src="js/demo/datatables-demo.js"></script> --}}
<script src="{{asset('assets/js/admin/common.js')}}"></script>

<script type="text/javascript">
  
</script>
<script>
  var classes = {!!$data["class"]!!};
  $( document ).ready(function(){
    $('#dataTable').DataTable({
      columnDefs: [ {
        orderable: false,
        className: 'select-checkbox',
        targets:   0
      } ],
      select: {
        style:    'os',
        selector: 'td:first-child'
      },
      order: [[ 1, 'asc' ]]
    });
  });
</script>
<script>
  //paste this code under the head tag or in a separate js file.
  //Wait for window load
  // $(window).load(function() {
    // 	// Animate loader off screen
    // 	$(".se-pre-con").fadeOut("slow");
    // });
  </script>
  
  @endsection