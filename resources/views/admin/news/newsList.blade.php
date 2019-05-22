@extends('admin.layout.layout')
@section('title')
Quản lí tin tức
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/cm-news.css')}}" rel="stylesheet" type="text/css">
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
                <h4>Danh sách bài viết</h4>
        </div>
    </div>
    <div class="row">
        {{-- filter condition --}}
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <form action="" method="get" class="col-md-12">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="type_id" class="col-md-4 common-label-inline">Phân loại:</label>
                        <select id="type_id" class="form-control col-md-8" name="type_id" required>
                            <option value="0">Tất cả bài viết</option>
                            @foreach ($newsType as $sy)
                            <option value="{{$sy->id}}" @if($type_id==$sy->id) {{"selected"}} @endif>{{$sy->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-1"><br>
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
                            <th>Hình ảnh nổi bật</th>
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
                            @if($list->image != "") 
                                <td><img class="featured-image" src="{{asset('images/news')}}/{{$list->image}}"></td>
                            @else 
                                <td><img class="featured-image" src="{{asset('assets/img/image-not-available.png')}}"></td>
                            @endif
                            <td>{{$list->title}}</td>
                            <td>{{$list->sumary}}</td>
                            <td><i class="far fa-edit"></i> <a href="{{ route('get_edit_new',['id'=>$list->id]) }}">Sửa</a></td>
                            </tr>
                          @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.container-fluid -->
                <a class="btn btn-success" href="{{route('get_add_new')}}"><i class="fas fa-plus-circle"></i> Thêm tin</a>
                <button onclick="deleteNew()" class="btn delete_all" style="background-color: #D98880; color: #fff"><i class="fas fa-minus-circle"></i> Xóa</button> 
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