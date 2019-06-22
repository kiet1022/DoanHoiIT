@extends('admin.layout.layout')
@section('title')
Danh sách sinh viên
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
      <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý sinh viên</li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh sách</li>
          </ol>
        </nav>
  </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Danh sách sinh viên</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
    <form action="{{ route('post_filter_student') }}" method="POST" class="col-md-12">
      @csrf
        <div class="form-row">
          <div class="form-group col-md-3 offset-md-3">
            <label for="studentShoolYear" class="col-md-4 common-label-inline">Niên khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
            <select id="studentShoolYear" class="form-control" name="studentShoolYear" required>
              @foreach ($schoolYears as $sy)
              <option value="{{$sy->id}}" {{ changeSelectedStatus(old('studentShoolYear'),"$sy->id") }}>{{$sy->course}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-group col-md-3">
            <label for="studentClass" class="col-md-4 common-label-inline">Lớp <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
            <select id="studentClass" class="form-control" name="studentClass" required>
              @foreach ($class as $sy)
              <option value="{{$sy->id}}" {{ changeSelectedStatus(old('studentClass'),"$sy->id") }}>{{$sy->class_name}}</option>
              @endforeach
            </select>
          </div>
        </div>
        {{-- advanced filter condition --}}
        <div class="col-md-12 pl-0">
          <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Tìm kiếm nâng cao
          </a>
        </div>

        <div class="collapse @if ( session()->has('_old_input') ) show @endif" id="collapseExample">
          <div class="form-row">

            {{-- Filter name --}}
            <div class="form-group col-md-3">
                <label for="filterSid">MSSV:</label>
            <input type="number" name="filterSid" id="filterSid" class="form-control" placeholder="Nhập MSSV..." value="{{old('filterSid')}}">
              </div>

            {{-- Filter name --}}
            <div class="form-group col-md-3">
              <label for="filterName">Họ tên:</label>
              <input type="text" name="filterName" id="filterName" class="form-control" placeholder="Nhập họ tên..." value="{{old('filterName')}}">
            </div>
            {{-- Filter sex --}}
            <div class="form-group col-md-3">
              <label for="filterSex">Giới tính:</label>
              <select name="filterSex" id="filterSex" class="form-control">
                <option value="0" {{ changeSelectedStatus(old('filterSex'),'0') }}>Chọn giới tính</option>
                <option value="1" {{ changeSelectedStatus(old('filterSex'),'1') }}>Nam</option>
                <option value="2" {{ changeSelectedStatus(old('filterSex'),'2') }}>Nữ</option>
                <option value="3" {{ changeSelectedStatus(old('filterSex'),'3') }}>Khác</option>
              </select>
            </div>
            {{-- Filter Address --}}
            <div class="form-group col-md-3">
                <label for="filterAddress">Quê quán:</label>
                <select name="filterAddress" id="filterAddress" class="form-control">
                    <option value="0" {{ changeSelectedStatus(old('filterAddress'),'0') }}>Chọn quê quán</option>
                  @foreach ($province as $pro)
                <option value="{{ $pro->id }}" {{ changeSelectedStatus(old('filterAddress'),"$pro->id") }}>{{$pro->name}}</option>
                  @endforeach
                </select>
              </div>
          </div>
        </div>
        <div class="form-group col-md-2 offset-md-10">
            <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
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
                  <td><input type="hidden" value="{{$list->student_id}}"></td>
                  <td>{{$list->student_id}}</td>
                  <td>{{$list->name}}</td>
                  <td>{{$list->schoolYear->course}}</td>
                  <td>{{$list->class->class_name}}</td>
                  <td>{!! changeGenderForList($list->sex) !!}</td>
                  <td>{{date('d/m/Y',strtotime($list->birthday))}}</td>
                  <td class="text-center">{!! changeStudyStatus($list->is_study)!!}</td>
                  <td class="text-center">
                    <a class="cm-label text-info detailToggle" data-id="{{$list->student_id}}" data-toggle="modal"><i class="fas fa-list" title="Chi tiết"></i></a>
                    <a href="{{ route('get_edit_student',['id'=>$list->student_id]) }}"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa"></i></a>
                    {{-- <a class="deleteOne" data-id="{{$list->student_id}}"><i class="fas fa-trash cm-label text-danger" title="Xóa"></i></a> --}}
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
      <button onclick="deleteStudent()" class="btn" id="deleteUser" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button>
  </div>
</div>

<!-- Button trigger modal -->
{{-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> --}}

<!-- Modal -->
<div class="modal animated jackInTheBox" id="studentDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  
</div>


@endsection
@section('js')
<script>
  var classes = {!!$class!!};
  var BASE_URL = "{{ asset('admin/student/') }}"
</script>
<!-- Page level custom scripts -->
<script src="{{asset('assets/js/admin/student_list.js')}}"></script>

@endsection