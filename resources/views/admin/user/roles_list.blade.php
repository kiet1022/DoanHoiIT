@extends('admin.layout.layout')
@section('title', 'Dự trù kinh phí')
@section('style')
<style>
  table.dataTable tr th.select-checkbox.selected::after {
    content: "✔";
    margin-top: -11px;
    margin-left: -4px;
    text-align: center;
    text-shadow: rgb(176, 190, 217) 1px 1px, rgb(176, 190, 217) -1px -1px, rgb(176, 190, 217) 1px -1px, rgb(176, 190, 217) -1px 1px;
}

</style>
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
                <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý Users</li>
                <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh sách quyền</li>
            </ol>
        </nav>
    </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Danh sách quyền truy cập</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
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
            <table class="table table-bordered table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
              <thead style="background: #f8f9fc">
                <tr>
                  <th></th>
                  <th>Mã quyền</th>
                  <th>Tên quyền</th>
                  <th>Mô tả</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                @foreach ($roles as $role)
                    <tr class="">
                      <td></td>
                      <td>{{ $role->id }}</td>
                      <td>{{ $role->name }}</td>
                      <td>{{ $role->description }}</td>
                      <td class="text-center">
                      <a class="edit-roles" data-content="{{ $role }}"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa quyền" data-toggle="tooltip" data-placement="top"></i></a>
                      </td>
                    </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <button class="btn btn-success" data-toggle="modal" data-target="#addNewModal"><i class="fas fa-plus-circle"></i> Thêm quyền</button>
      <button onclick="deleteActivity()" class="btn" id="deleteFund" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa quyền</button>
    </div>
  </div>
  {{-- Breadcrumb --}}
  <div class="col-md-12">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb cm-breadcrumb">
        <li class="breadcrumb-item"><a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><i class="fas fa-arrow-circle-left"></i> Quay lại</a></li>
        {{-- <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa thông tin</li> --}}
      </ol>
    </nav>
  </div>

  <!-- The edit Modal -->
  <div class="modal fade" id="editModal">
    <div class="modal-dialog modal-lg">
      <form action="{{ route('edit_role') }}" method="POST">
        @csrf
          <div class="modal-content">
  
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Chỉnh sửa quyền</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body" id="content-body">

              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="submit" class="btn btn-success cm-btn-form">Lưu</button>
                <button type="button" class="btn btn-warning cm-btn-form" data-dismiss="modal">Đóng</button>
              </div>
              
            </div>
      </form>
    </div>
  </div>


    <!-- The add new Modal -->
    <div class="modal fade" id="addNewModal">
        <div class="modal-dialog modal-lg">
          <form action="{{ route('add_role') }}" method="POST">
            @csrf
              <div class="modal-content">
      
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Thêm quyền</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  
                  <!-- Modal body -->
                  <div class="modal-body" id="content-body">
                      <div class="form-group">
                          <label for="name">Tên quyền <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                          <input class="form-control" type="text" name="name" id="name" placeholder="Nhập tên quyền" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Mô tả <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <textarea class="form-control" name="description" id="description" cols="30" rows="10" required></textarea>
                        </div>
                  </div>
                  
                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-success cm-btn-form">Lưu</button>
                    <button type="button" class="btn btn-warning cm-btn-form" data-dismiss="modal">Đóng</button>
                  </div>
                  
                </div>
          </form>
        </div>
      </div>
  @endsection
  @section('js')
  <!-- Page level plugins -->
  {{-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> --}}
  <script>
    var BASE_URL = "{{ asset('admin/activities/funding') }}";
  </script>
  <script>
      @if(session('error'))
      var error = "{{session('error')}}";
      showNotify('error',error);
      @endif
      @if(session('success'))
      var success = "{{session('success')}}";
      showNotify('success',success);
      @endif
  </script>
  <script src="{{asset('assets/js/admin/user/roles_list.js')}}"></script>
  @endsection