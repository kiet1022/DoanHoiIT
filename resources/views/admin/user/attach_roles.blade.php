@extends('admin.layout.layout')
@section('title', 'Dự trù kinh phí')
@section('style')
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý Users</li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="{{ route('get_user_list') }}"> Danh sách user</a></li>
        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Phân quyền</li>
      </ol>
    </nav>
  </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Danh sách quyền truy cập</h4>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">   
      <!-- DataTales Example -->
      <div class="card mb-4">
        
        <div class="card-body">
          <div class="form-row">
            <div class="form-group col-4">
              <label for="id">ID người dùng:</label>
              <input type="text" class="form-control" name="id" id="id" value="{{ $user->id }}" readonly>
            </div>
            
            <div class="form-group col-4">
              <label for="student_id">MSSV:</label>
              <input type="text" class="form-control" name="student_id" id="student_id" value="{{ $user->student_id }}" readonly>
            </div>
            
            <div class="form-group col-4">
              <label for="name">Họ tên:</label>
              <input type="text" class="form-control" name="name" id="name" value="{{ $user->student->name }}" readonly>
            </div>
          </div>
        </div>
        
      </div>
      
      <!-- DataTales Example -->
      <div class="card mb-4">
        
        <div class="card-body">
          <form action="{{ route('post_attach_role') }}" method="post">
            @csrf
            <div class="form-row">
              <input type="hidden" name="iduser" value="{{ $user->id }}">
              {{-- is Union --}}
              {{-- <div class="form-group cm-inline-form col-md-3">
                <label for="0" class="col-md-12 p-0">Toàn quyền</label>
                <input class="form-control" id="toggleisUnion_0" name="status" type="checkbox" data-width="170" data-height="20">
              </div> --}}
              @foreach ($roles as $role)
              <div class="form-group cm-inline-form col-md-3">
                <label for="{{ $role->id }}" class="col-md-12 p-0">{{ $role->description}}</label>
                <input class="form-control toggleisUnion" id="{{ $role->id }}" name="role_id[]" type="checkbox" data-width="170" data-height="20" value="{{ $role->id }}"
                {{ changeCheckedRoleStatus($ownRoles,"$role->id") }}>
              </div>
              @endforeach
            </div>
            {{-- <div class="form-row">
              <div class="col-12 d-flex flex-wrap">
                <div class="form-group">
                  
                  <label for="{{ $role->id }}">{{ $role->name}}</label>
                  <input type="checkbox" name="role-id" id="{{ $role->id }}" class="form-control" value="{{ $role->id }}">
                  
                </div>
              </div>
            </div> --}}
          
        </div>
        
      </div>
      <div class="text-center">
          <button class="btn btn-success" data-toggle="modal" type="submit"><i class="fas fa-plus-circle"></i> Cập nhật</button>
      </div>
    </form>
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
  @endsection
  @section('js')
  <!-- Page level plugins -->
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