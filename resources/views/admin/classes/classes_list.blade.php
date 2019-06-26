@extends('admin.layout.layout')
@section('title')
Danh sách chi đoàn
@endsection
@section('style')
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh sách chi đoàn</li>
          </ol>
        </nav>
      </div>
    <div class="row">
        <div class="col page-title-header">
            <h4>Danh sách chi đoàn</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
                    <!-- Begin Page Content -->      
                <!-- DataTales Example -->
                <div class="card mb-4">
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead style="background: #f8f9fc">
                          <tr>
                            <th></th>
                            <th style="display: none;">ID</th>
                            <th>Lớp</th>
                            <th>Khóa</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($classes as $list)
                          <tr>
                            <td></td>
                            <td style="display: none;">{{$list->id}}</td>
                            <td> {{$list->class_name}}</td>
                            <td>{{$list->schoolYear->name}}</td>
                            <td><i class="far fa-edit"></i> <a class="editToggle" data-id="{{$list->id}}"  data-toggle="modal" href="">Sửa</a></td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.container-fluid -->
                <!-- <a class="btn btn-success" href="{{route('get_add_class')}}"><i class="fas fa-plus-circle"></i> Thêm Lớp</a> -->
                <a class="btn btn-success text-white" id="addClass"><i class="fas fa-plus-circle"></i> Thêm chi đoàn</a>

                <button onclick="deleteClass()"  class="btn delete_all" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> 
        </div>
    </div>
    <!-- add academic Modal -->
<div class="modal animated jackInTheBox" id="formAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
</div>
 <!-- edit academic Modal -->
<div class="modal animated jackInTheBox" id="formEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
</div>
</div>
@endsection
@section('js')
 <!-- Page level plugins -->
 <!-- Page level custom scripts -->
 {{-- <script src="js/demo/datatables-demo.js"></script> --}}

<script>
  var BASE_URL = "{{ asset('admin/classes/') }}"
</script>
<!-- Page level custom scripts -->
<script src="{{asset('assets/js/admin/class_list.js')}}"></script>
<script>
//paste this code under the head tag or in a separate js file.
//Wait for window load
// $(window).load(function() {
    // 	// Animate loader off screen
    // 	$(".se-pre-con").fadeOut("slow");
    // });
</script>
@endsection