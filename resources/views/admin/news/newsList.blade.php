@extends('admin.layout.layout')
@section('title')
Quản lí tin tức
@endsection
@section('style')
<link href="{{asset('assets/css/admin/cm-news.css')}}" rel="stylesheet" type="text/css">
@endsection
@section('main_content')
<div class="container-fluid">
    <div class="row">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
            <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý tin tức</li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Danh sách bài viết</li>
          </ol>
        </nav>
      </div>
    <div class="row">
        {{-- filter condition --}}
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <form action="" method="get" class="col-md-12">
                <div class="form-row">
                    <div class="form-group col-md-4 offset-md-3">
                        <label for="type_id" class="col-md-4 common-label-inline">Phân loại:</label>
                        <select id="type_id" class="form-control col-md-8" name="type_id" required>
                            <option value="0">Tất cả bài viết</option>
                            @foreach ($newsType as $sy)
                            <option value="{{$sy->id}}" @if($type_id==$sy->id) {{"selected"}} @endif>{{$sy->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-1"><br>
                      <label></label>
                        <button type="submit" class="btn btn-primary right"><i class="fas fa-filter"></i> Lọc</button>
                    </div>

                </div>
                
            </form>
        </div>
        {{-- New list --}}
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
                            <th>ID</th>
                            <th>Loại tin</th>
                            <th>Tiêu đề</th>
                            <th>Tóm tắt</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($news as $list)
                          <tr>
                            <td><input type="hidden" value="{{$list->id}}"></td>
                            <td>{{$list->id}}</td>
                            <td>{{$list->ofType->name}}</td>
                            <td>{{$list->title}}</td>
                            <td>{{$list->sumary}}</td>
                            <td class="text-center">
                                <a href="{{ route('get_edit_new',['id'=>$list->id]) }}"><i class="fas fa-edit cm-label text-primary" title="Chỉnh sửa tin tức" data-toggle="tooltip" data-placement="top"></i></a>
                            </td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.container-fluid -->
                <div class="text-center">
                    <a class="btn btn-success" href="{{route('get_add_new')}}"><i class="fas fa-plus-circle"></i> Thêm tin</a>
                    <button onclick="deleteNew()" class="btn delete_all cm-btn-form" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> 
                </div>
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
  var BASE_URL = "{{ asset('admin/news/') }}"
</script>
<!-- Page level custom scripts -->
<script src="{{ asset('assets/js/common.js') }}"></script>
<script src="{{asset('assets/js/admin/news.js')}}"></script>
<script>
//paste this code under the head tag or in a separate js file.
//Wait for window load
// $(window).load(function() {
    // 	// Animate loader off screen
    // 	$(".se-pre-con").fadeOut("slow");
    // });
</script>
@endsection