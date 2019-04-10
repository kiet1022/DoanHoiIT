@extends('admin.layout.layout')
@section('title')
Sơ đồ Ban chấp hành Đoàn Khoa
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
                <h4>Sơ đồ Ban chấp hành Đoàn Khoa</h4>
        </div>
    </div>
    <div class="row">

      <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <div style="width:100%; height:700px;" id="orgchart"></div>
      </div>
    </div>
</div>

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
    
    <script>
        var bithuArr = [];
        var phoBithuArr = [];
        var uvBCHArr = [];
        @forEach($execComm as $comm)
            if("{!! $comm->level !!}" == "1"){
                bithuArr.push({
                    "name":"{!! $comm->ofStudent->name !!}",
                    "MSSV":"{!! $comm->ofStudent->student_id !!}",
                    "level":"Bí thư"});
            } else if ("{!! $comm->level !!}" == "2"){
                phoBithuArr.push({
                    "name":"{!! $comm->ofStudent->name !!}",
                    "MSSV":"{!! $comm->ofStudent->student_id !!}",
                    "level":"Phó Bí thư"});
            } else {
                uvBCHArr.push({
                    "name":"{!! $comm->ofStudent->name !!}",
                    "MSSV":"{!! $comm->ofStudent->student_id !!}",
                    "level":"Ủy viên BCH"});
            }
            
        @endforEach
    var chart = new OrgChart(document.getElementById("orgchart"), {
            nodeBinding: {
                field_0: "name",
                field_1: "title",
                field_2: "phone",
                img_0: "img"
            },
            template: "mila"
        });
        var j = 1;
        for(var i = 0; i < bithuArr.length; i++){
            chart.add({ id: j, name: bithuArr[0].name, img: "{{asset('assets/img/avatar.jpg')}}", title:"Bí thư", phone:"0346356275"});
            j++;
        }
        for(var i = 0; i < phoBithuArr.length; i++){
            chart.add({ id: j,pid: 1, tags: ["assistant"], name: phoBithuArr[i].name, img: "{{asset('assets/img/avatar.jpg')}}", title: phoBithuArr[i].level})
            j++;
        }        
        for(var i = 0; i < uvBCHArr.length; i++){
            chart.add({ id: j, pid: 1, name: uvBCHArr[i].name,img: "{{asset('assets/img/avatar.jpg')}}" , title: uvBCHArr[i].level});
            j++;
        }
        chart.draw(BALKANGraph.action.init);
            
    </script>
        
        
        @endsection