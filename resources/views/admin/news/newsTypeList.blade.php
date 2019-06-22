@extends('admin.layout.layout')
@section('title')
Quản lí tin tức
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý tin tức</li>
        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh mục loại tin</li>
      </ol>
    </nav>
  </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Danh mục loại tin</h4>
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
                  <th>ID</th>
                  <th>Name</th>
                  <th>Create date</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach ($newsType as $list)
                <tr>
                  <td> <input type="hidden" value="{{$list->id}}"></td>
                  <td>{{$list->id}}</td>
                  <td>{{$list->name}}</td>
                  <td>{{$list->created_at}}</td>
                  <td>
                    <i class="far fa-edit"></i> 
                    <!-- <a href="{{ route('get_edit_news_type',['id'=>$list->id]) }}">Sửa</a> -->
                    <a class="editToggle" data-id="{{$list->id}}" data-toggle="modal" href="">Sửa</a>
                  </td>
                </tr>
                @endforeach
              </tbody>  
            </table>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->  <!-- href="{{route('get_add_new_type')}}" -->
      <a class="btn btn-success" id="addType"><i class="fas fa-plus-circle"></i> Thêm loại tin</a>
      <button onclick="deleteType()" class="btn" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> 
    </div>
  </div>
  
  <!-- edit new type Modal -->
  <div class="modal animated jackInTheBox" id="formEditType" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"></div>
  <!-- add new type Modal -->
  <div class="modal animated jackInTheBox" id="formAddType" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  </div>
  @endsection
  @section('js')
  <!-- Page level plugins -->
  <!-- Page level custom scripts -->
  {{-- <script src="js/demo/datatables-demo.js"></script> --}}
  <!-- Page level custom scripts -->
  <script>
    var BASE_URL = "{{ asset('admin/news/type/') }}";
  </script>
  <script src="{{asset('assets/js/admin/new_type.js')}}"></script>
  
  @endsection