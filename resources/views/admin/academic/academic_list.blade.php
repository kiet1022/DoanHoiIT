@extends('admin.layout.layout')
@section('title')
Chương trình đào tạo
@endsection
@section('style')
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Quản lý niên khóa</li>
          </ol>
        </nav>
      </div>
    <div class="row">
        <div class="col page-title-header">
            <h4>Niên khóa</h4>
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
                            <th style="display: none;"></th>
                            <th>Niên khóa</th>
                            <th>Khóa</th>
                            <th>Thời gian đào tạo</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($schoolYear as $list)
                          <tr>
                            <td></td>
                            <td style="display: none;">{{$list->id}}</td>
                            <td>{{$list->name}}</td>
                            <td> {{$list->course}}</td>
                            <td>@if($list->type==1){{"2 năm"}} @elseif($list->type==2){{"4 năm"}} @endif</td>
                            <td><i class="far fa-edit"></i> 
                                <!-- <a href="{{ route('get_edit_program',['id'=>$list->id]) }}">Sửa</a> -->
                                <a class="editToggle" data-id="{{$list->id}}"  data-toggle="modal" href="">Sửa</a>
                                
                            </td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.container-fluid -->
                <!-- <a class="btn btn-success" href="{{route('get_add_program')}}"><i class="fas fa-plus-circle"></i> Thêm tin</a> -->
                <a class="btn btn-success" id="addProgram"><i class="fas fa-plus-circle"></i> Thêm chương trình đào tạo</a>
                <button onclick="deleteProgram()" class="btn delete_all" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> 
        </div>
    </div>
    <!-- add academic Modal -->
<div class="modal animated jackInTheBox" id="formAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
</div>
 <!-- edit academic Modal -->
<div class="modal animated jackInTheBox" id="formEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
</div>
@endsection
@section('js')
 <!-- Page level plugins -->
 <!-- Page level custom scripts -->
 {{-- <script src="js/demo/datatables-demo.js"></script> --}}
<script>
  var BASE_URL = "{{ asset('admin/school-year/education-program/') }}"
</script>
<script src="{{asset('assets/js/admin/program.js')}}"></script>
<script>
//paste this code under the head tag or in a separate js file.
//Wait for window load
// $(window).load(function() {
    // 	// Animate loader off screen
    // 	$(".se-pre-con").fadeOut("slow");
    // });
</script>
@endsection