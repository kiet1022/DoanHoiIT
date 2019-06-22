@extends('admin.layout.layout')
@section('title')
Sơ đồ Ban chấp hành
@endsection
@section('style')
<link href="{{asset('assets/css/admin/execComm/exec_comm_chart.css')}}" rel="stylesheet">
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý Ban chấp hành</li>
        <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> <a href="{{route('get_ec_list')}}"> Danh sách BCH</a></li>
        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Sơ đồ tổ chức</li>
      </ol>
    </nav>
  </div>
  <div class="row">
    <div class="col page-title-header">
      <h4>Sơ đồ @if($commType == "0")Ban chấp hành Đoàn Khoa @elseif($commType == "1")Ban chấp hành Liên chi hội @endif</h4>
    </div>
  </div>
  <div class="row">
    
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <div style="width:100%; height:700px;" id="orgchart"></div>
      <a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><i class="fas fa-arrow-circle-left"></i> Quay lại</a>
      <span> | </span>
      @if($commType == "1")
      <a class="cm-breadcrumb-a" href="{{ route('get_ec_chart',["type"=>"0"]) }}">Sơ đồ BCH Đoàn Khoa <i class="fas fa-arrow-circle-right"></i></a>
      @elseif($commType == "0")
      <a class="cm-breadcrumb-a" href="{{ route('get_ec_chart',["type"=>"1"]) }}">Sơ đồ BCH Liên chi hội <i class="fas fa-arrow-circle-right"></i></a>
      @endif
    </div>
  </div>
</div>

@endsection
@section('js')
<!-- Page level plugins -->
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
  
  /**
  * Render Chart
  */
  
  // BCH Đoàn
  @if($commType == "0")
  @forEach($execComm as $comm)
  if("{!! $comm->level !!}" == "1"){
    bithuArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"Bí thư",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  } else if ("{!! $comm->level !!}" == "2"){
    phoBithuArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"Phó Bí thư",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  } else if("{!! $comm->level !!}" == "3"){
    phoBithuArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"Phó Bí thư (LCH Trưởng)",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  }else {
    uvBCHArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"Ủy viên BCH",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  }
  
  @endforEach
  @elseif($commType == "1")
  // BCH LCH
  @forEach($execComm as $comm)
  if("{!! $comm->level !!}" == "1"){
    bithuArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"LCH Trưởng",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  } else if ("{!! $comm->level !!}" == "2"){
    phoBithuArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"LCH Phó",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  } else {
    uvBCHArr.push({
      "name":"{!! $comm->ofStudent->name !!}",
      "MSSV":"{!! $comm->ofStudent->student_id !!}",
      "level":"Ủy viên BCH",
      "phone": "{!! $comm->ofStudent->phone_no !!}",
      "image": "{{ $comm->ofStudent->image }}"
    });
  }
  
  @endforEach
  @endif
  
  // init chart
  var chart = new OrgChart(document.getElementById("orgchart"), {
    nodeBinding: {
      field_0: "name",
      field_1: "title",
      field_2: "mssv",
      field_3: "phone",
      img_0: "img"
    },
    template: "rony",
    toolbar: true,
    layout: BALKANGraph.tree,
    scaleInitial: BALKANGraph.match.boundary,
    align: BALKANGraph.ORIENTATION,
    menu: {
      pdf: { text: "Export PDF" },
      png: { text: "Export PNG" },
      svg: { text: "Export SVG" },
      csv: { text: "Export CSV" }
    },
  });
  
  // pass data to nodes
  var j = 1;
  var BASE_IMAGE_URL = "{{asset('assets/img/students/')}}";
  var IMAGE_NOT_AVAILABLE = "{{asset('assets/img/image-not-available.png')}}";
  
  function checkExistImage(img){
    var result;
    if(img === "null"){
      result = IMAGE_NOT_AVAILABLE;
    }else {
      result = BASE_IMAGE_URL+"/"+img;
    }
    return result;
  }
  for(var i = 0; i < bithuArr.length; i++){
    var img = checkExistImage(bithuArr[i].image);
    chart.add({ 
      id: j, 
      name: bithuArr[0].name, 
      img: img,
      title: bithuArr[i].level, 
      phone: bithuArr[i].phone,
      mssv: bithuArr[i].MSSV});
      j++;
    }
    for(var i = 0; i < phoBithuArr.length; i++){
      var img = checkExistImage(phoBithuArr[i].image);
      chart.add({ 
        id: j,
        pid: 1, 
        tags: ["assistant"], 
        name: phoBithuArr[i].name, 
        img: img, 
        title: phoBithuArr[i].level, 
        phone: phoBithuArr[i].phone,
        mssv: phoBithuArr[i].MSSV})
        j++;
      }
      for(var i = 0; i < uvBCHArr.length; i++){
        var img = checkExistImage(uvBCHArr[i].image);
        chart.add({ 
          id: j, 
          pid: 1, 
          name: uvBCHArr[i].name,
          img: img,
          title: uvBCHArr[i].level, 
          phone: uvBCHArr[i].phone,
          mssv: uvBCHArr[i].MSSV});
          j++;
        }
        
        // assign tag name for node
        for (var i = 0; i < chart.config.nodes.length; i++) {
          var node = chart.config.nodes[i];
          switch (node.title) {
            case "Bí thư":
            case "LCH Trưởng":
            node.tags = ["BT"];
            break;
            case "Phó Bí thư":
            case "LCH Phó":
            node.tags = ["assistant"];
            break;
            case "Ủy viên BCH":
            node.tags = ["UV"];
            break;
          }
          // draw chart
          chart.draw(BALKANGraph.action.init);
        }
        
      </script>
      @endsection