@extends('user.layout.layout')
@section('title')
Danh mục tin
@endsection
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">

<meta name="csrf-token" content="{{ csrf_token() }}">
<style>
  .no-js #loader {
    display: none;
  }

  .js #loader {
    display: block;
    position: absolute;
    left: 100px;
    top: 0;
  }

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
<!-- PAGE HEADER -->
<div class="page-header">
  <div class="page-header-bg" style="background-image: url('{{asset('assets/img/user/banner.jpg')}}');" data-stellar-background-ratio="0.5"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-10 text-center">
        <h1 class="text-uppercase"></h1>
      </div>
    </div>
  </div>
</div>
<!-- /PAGE HEADER -->
<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">

      <div class="col-md-8">
        <form id="filterActivity" action="" method="get" class="col-md-12">
          <div class="col-md-6">
            <select name="activity-type" class="form-control">
              <option value="0">Tất cả chương trình</option>
              <option value="1"> Chương trình đã đăng kí</option>
            </select>
          </div>
        </form>

        <!-- activity  -->
        @foreach ($activity as $list)
        <div class=" activity-detail col-md-12 rounded">
          <div class="activity activity-row">
            <div class="activity-body">
              <h3 class="activity-title col-md-10"><a class="btnView" data-id="{{$list->id}}" data-toggle="modal">{{$list->name}}</a></h3>
              <div class="col-md-2"><a class="btnView" data-id="{{$list->id}}" data-toggle="modal"> <i class="fas fa-eye cm-label text-primary"></i> </a></div>
              <p class="col-md-12">Thời gian đăng kí: <span>{{date('d/m/Y',strtotime($list->start_regis_date))}}</span> - <span>{{date('d/m/Y',strtotime($list->end_regis_date))}}</span> </p>
              <p class="col-md-9"> Số lượng đăng ký: <span>10/{{$list->register_number}}</span></p>

              @if($list->end_regis_date < Carbon\Carbon::today()) 
                <p class="col-md-3 time-expired">Hết hạn đăng kí</p>
              @else
                @if(count($registActivity)==null)
                <div class="col-md-3"><button class="btn btnRegist" id="activity_{{$list->id}}" data-id="{{$list->id}}">Đăng kí</button></div>
               
                @else
                  @foreach ($registActivity as $listRes)
                    @if ($listRes->activity_id ===$list->id)
                      <p class="col-md-3 time-expired">Đã đăng kí</p>
                    @endif
                  @endforeach
                @endif
              @endif
            </div>
          </div>
        </div>
        @endforeach
        <!-- /activity -->
      </div>
      @include('user.layout.sideBarRight')
    </div>
    <!-- /row -->

  </div>

  <!-- view activity Modal -->
  <div class="modal animated jackInTheBox" id="formViewActivity" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"></div>
  <!-- /container -->
</div>
<!-- /SECTION -->
@endsection

@section('js')
<script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('assets/vendor/datatables/js/dataTables.select.min.js')}}"></script>
<script src="{{ asset('assets/js/common.js') }}"></script>

<script>
  var BASE_URL = "{{ asset('/activity/') }}"
</script>
<script type="text/javascript">
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });
  $('.btnView').on('click', function() {
    var id = $(this).data('id');
    $.ajax({
      url: BASE_URL + "/view.php",
      method: 'POST',
      data: {
        id: id,
      }
    }).done(function(data) {
      console.log(data);
      $('#formViewActivity').html(data);
      $('#formViewActivity').modal('show');
    }).fail(function(xhr, status, error) {
      console.log(this.url);
      console.log(status);
      console.log(error);
    });
  });
  $('.btnRegist').on('click', function() {
    var id = $(this).data('id');
    var buttonId = "#activity_" + id;
    $.ajax({
      url: BASE_URL + "/registActivity.php",
      method: 'POST',
      data: {
        id: id,
      }
    }).done(function(data) {
      if (data.result == "OK") {
        alert('Đăng kí hoạt động thành công');
        $(buttonId).attr("disabled", true);
      } else {
        alert('Đăng kí hoạt động thất bại')
      }
      // console.log(data);
      // $('#formViewActivity').html(data);
      // $('#formViewActivity').modal('show');
    }).fail(function(xhr, status, error) {
      alert('Đăng kí hoạt động thất bại')
      console.log(this.url);
      console.log(status);
      console.log(error);
    });
  });
   $('select').change(function () {
     document.getElementById('filterActivity').submit();
 });
</script>
@endsection