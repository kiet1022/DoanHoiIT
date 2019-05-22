@extends('admin.layout.layout')
@section('title','Chỉnh sửa dự trù')
@section('style')
<link href="{{asset('assets/vendor/datatables/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/vendor/datatables/css/select.dataTables.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/common2.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/css/admin/activity/list_activity.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Chỉng sửa dự trù</h4>
    </div>
  </div>
  <div class="row">
    {{-- basic filter condition --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="#" class="col-md-12" >
        <div class="form-row">
          {{-- Birthday --}}
          <div class="form-group cm-inline-form col-md-4 ">
            <label for="year" class="col-md-12 p-0">Tên chương trình</label>
            <input type="text" class="form-control" name="name" value="{{ $activityFund[0]->fund->activity->name }}" placeholder="Tên chương trình" readonly>
          </div>
          {{-- Birthday --}}
          <div class="form-group cm-inline-form col-md-4">
            <label for="semester" class="col-md-12 p-0">Người đứng chính</label>
            <input type="text" class="form-control" name="name" value="{{ $activityFund[0]->fund->activity->leadBy->name }}" placeholder="Người đứng chính" readonly>
          </div>
          {{-- Birthday --}}
          <div class="form-group cm-inline-form col-md-4">
            <label for="activity" class="col-md-12 p-0">Thời gian diễn ra</label>
            <input type="text" class="form-control" name="name" value="{{date('d/m/Y',strtotime($activityFund[0]->fund->activity->start_date))}} - {{date('d/m/Y',strtotime($activityFund[0]->fund->activity->end_date))}}" placeholder="Thời gian diễn ra" readonly>
          </div>
        </div>
      </form>
    </div>
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('post_edit_activity_funding',['id'=> $activityFund[0]->fund->id]) }}" method="post" id="test">
        @csrf
        <input type="hidden" name="id"  value="{{ $activityFund[0]->fund->activity->id }}">
        <div id="in-card-content">
          @foreach ($activityFund as $detail)
          <div class="card mb-3" aria-hidden="true" id="card_{{$detail->id}}">
            <input type="hidden" name="detail_id_[]" value="{{$detail->id}}">
            <div class="card-header">
              <div class="form-row">
                <div class="col-md-6">
                  <h6 class="m-0 font-weight-bold text-primary">Chi tiết dự trù</h6>
                </div>
                
                <div class="col-md-6">
                  <button type="button" class="close mr-2 text-danger delete" data-delete="{{$detail->id}}"><i class="fas fa-minus" title="Xóa nội dung"></i></button>
                  <button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>
                </div>
              </div>
              
            </div>
            <div class="card-body">
              <div class="form-row">
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="accontent_0">Nội dung:</label>
                  <input type="text"  class="form-control" name="content_[]" id="accontent_{{$detail->id}}"  data-id="{{$detail->id}}"  value="{{$detail->content}}" required>
                </div>
                
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="unit_0">Đơn vị tính:</label>
                  <input type="text"  class="form-control" name="unit_[]" id="unit_{{$detail->id}}" data-id="{{$detail->id}}" value="{{$detail->unit}}">
                </div>
                
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="unitPrice_0">Đơn giá:</label>
                  <input type="text"  class="form-control unitPrice" name="unitPrice_[]" id="unitPrice_{{$detail->id}}" data-id="{{$detail->id}}" value="{{$detail->unit_price}}" required>
                </div>
                
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="amount_0">Số lượng:</label>
                  <input type="number"  class="form-control" name="amount_[]" id="amount_{{$detail->id}}" data-id="{{$detail->id}}"  value="{{$detail->amount}}" required>
                </div>
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="expectedValue_0">Thành tiền:</label>
                  <input type="text"  class="form-control expectedValue" name="expectedValue_[]" id="expectedValue_{{$detail->id}}" data-id="{{$detail->id}}" value="{{$detail->expected_value}}" required>
                </div>
                <div class="form-inline cm-inline-form col-md-2">
                  <label for="paymentType_0">Hình thức thanh toán:</label>
                  <select name="paymentType_[]" id="paymentType_0" class="form-control" style="width:80%;" data-id="0" required>
                    <option value="Ký nhận" {{ changeSelectedStatus("Ký nhận","$detail->payment_type") }}>Ký nhận</option>
                    <option value="Hóa đơn đỏ" {{ changeSelectedStatus("Hóa đơn đỏ","$detail->payment_type") }}>Hóa đơn đỏ</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          @endforeach
        </div>
        <hr class="sidebar-divider">
        <div class="col-12 text-center">
          <button id="submit" type="submit" class="btn btn-success cm-btn-form">Save</button>
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
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Chú ý!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          Bạn có chắn chắn muốn xóa dự trù của chương trình {{ $activityFund[0]->fund->activity->name }}
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-danger">Delete</button>
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
  <script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
  <script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
  <script>
    var BASE_URL = "{{ asset('admin/activities/funding') }}";
    @if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    showNotify('success',success);
    @endif
    var count = {{ count($activityFund) }}
    var activityName = "{{ $detail->fund->activity->name }}";
    var activityFundId = {{ $activityFund[0]->fund->id }};
</script>
<script src="{{asset('assets/js/admin/fund/edit_activity_fund.js')}}"></script>
@endsection