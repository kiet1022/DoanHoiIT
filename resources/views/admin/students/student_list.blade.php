@extends('admin.layout.layout')
@section('title')
Danh sách sinh viên
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
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
            <form action="/action_page.php" method="POST" class="col-md-12">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="shoolyear">Khóa:</label>
                        <select id="shoolyear" class="form-control">
                          @foreach ($schoolYears as $sy)
                        <option value="{{$sy->id}}">{{$sy->course}}</option>
                          @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="class">Lớp:</label>
                        <select id="class" class="form-control">
                            <option>151101</option>
                            <option>151102</option>
                            <option>151103</option>
                            <option>159100</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
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
                            <th>Lớp</th>
                            <th>Giới tính</th>
                            <th>Ngày sinh</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($studentList as $list)
                          <tr>
                            <td></td>
                          <td>{{$list->student_id}}</td>
                              <td>{{$list->name}}</td>
                              <td>{{$list->class->class_name}}</td>
                              <td>{!! changeGenderForList($list->sex) !!}</td>
                              <td>{{$list->birthday}}</td>
                              <td>{{$list->address}}</td>
                              <td>{{$list->phone_no}}</td>
                              <td><i class="far fa-edit"></i> <a href="">Sửa</a></td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              <!-- /.container-fluid -->
              <a class="btn btn-success" href="{{route('get_add_student')}}"><i class="fas fa-plus-circle"></i> Thêm 1 sinh viên</a>
                  <button class="btn btn-info"><i class="fas fa-file-import"></i> Import Sinh viên</button>
                  <button class="btn" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button>
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
<script>
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