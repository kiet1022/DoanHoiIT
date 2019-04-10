@extends('admin.layout.layout')
@section('title')
Danh sách ban chấp hành
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">

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
                <h4>Quản lý ban chấp hành</h4>
        </div>
    </div>
    <div class="row">

      <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
          
      </div>
        {{-- Student list --}}
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            
                    <!-- Begin Page Content -->      
                <!-- DataTales Example -->
                <div class="card mb-4">
                  <div class="card-header py-3 text-center">
                  <form action="{{ route('get_ec_list') }}" method="get">
                    @csrf
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-primary" name="type" value="0">BCH Đoàn</button>
                        <button type="submit" class="btn btn-primary" name="type" value="1">BCH Liên Chi hội</button>
                        <button type="submit" class="btn btn-primary" name="type" value="2">Cộng tác viên</button>
                      </div>
                  </form>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead style="background: #f8f9fc">
                          <tr>
                            <th></th>
                            <th>Hình ảnh</th>
                            <th>MSSV</th>
                            <th>Họ tên</th>
                            <th>Chức vụ</th>
                            <th>Giới tính</th>
                            <th>SDT Liên hệ</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($execComm as $list)
                          <tr>
                            <td></td>
                            <td>{{$list->student_id}}</td>
                            <td>{{$list->student_id}}</td>
                            <td>{{$list->ofStudent->name}}</td>
                            <td class="text-center"> 
                              {!! changeLevelLabel($list->level) !!}
                            </td>
                            <td class="text-center">
                                {!! changeGenderForList($list->ofStudent->sex) !!}
                            </td>
                          <td>{{ $list->ofStudent->phone_no }}</td>
                            <td><i class="far fa-edit"></i> <a href="{{ route('get_edit_student',['id'=>$list->student_id]) }}">Sửa</a></td>
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
                  <a class="btn btn-success" href="{{route('get_ec_chart')}}"><i class="fas fa-plus-circle"></i> Sơ đồ</a>
                  
        </div>
    </div>
</div>

{{-- <!-- Modal -->
<div class="modal animated jackInTheBox" id="studentDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div style="width:100%; height:700px;" id="orgchart"></div>
  </div> --}}
@endsection
@section('js')
 <!-- Page level plugins -->
<script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
<script src="{{ asset('assets/vendor/orgchart.js') }}"></script>
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
        order: [[ 1, 'asc' ]],
        "pageLength": 25,
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng trên trang",
            "zeroRecords": "Không có dữ liệu.",
            "info": "Trang _PAGE_/_PAGES_",
            "infoEmpty": "Không tồn tại dữ liệu.",
            "infoFiltered": "(đã lọc từ _MAX_ dòng)",
            "search": "Tìm kiếm"
        }
    });
        });
    </script>   
@endsection