@extends('admin.layout.layout')
@section('title')
Danh sách người dùng
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
                <h4>Quản lí người dùng</h4>
        </div>
    </div>
    <div class="row">
        {{-- User list --}}
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
                            <th>email</th>
                            <th>level</th>
                            <th>name</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($studentList as $list)
                          <tr>
                            <td></td>
                            <td>{{$list->student_id}}</td>
                            <td>{{$list->email}}</td>
                            <td>{{$list->level}}</td>
                            <td>{{$list->student->name}}</td>
                            <td><i class="far fa-edit"></i> <a href="{{ route('get_edit_student',['id'=>$list->student_id]) }}">Sửa</a></td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              <!-- /.container-fluid -->
              <a class="btn btn-success" href="{{route('get_add_student')}}"><i class="fas fa-plus-circle"></i> Thêm user</a>
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