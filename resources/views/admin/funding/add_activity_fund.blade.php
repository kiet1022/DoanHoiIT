@extends('admin.layout.layout')
@section('title','Tạo dự trù')
@section('style')
@section('main_content')
<div class="container-fluid">
  <div class="row">
    <div class="col page-title-header">
      <h4>Tạo dự trù</h4>
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
            <input type="text" class="form-control" name="name" value="{{ $activity->name }}" placeholder="Tên chương trình" readonly>
          </div>
          {{-- Birthday --}}
          <div class="form-group cm-inline-form col-md-4">
            <label for="semester" class="col-md-12 p-0">Người đứng chính</label>
            <input type="text" class="form-control" name="name" value="{{ $activity->leadBy->name }}" placeholder="Người đứng chính" readonly>
          </div>
          {{-- Birthday --}}
          <div class="form-group cm-inline-form col-md-4">
            <label for="activity" class="col-md-12 p-0">Thời gian diễn ra</label>
            <input type="text" class="form-control" name="name" value="{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}" placeholder="Thời gian diễn ra" readonly>
          </div>
        </div>
      </form>
    </div>
    {{-- Student list --}}
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
      <form action="{{ route('post_add_activity_funding') }}" method="post" id="test">
        @csrf
        <input type="hidden" name="id"  value="{{ $activity->id }}">
        <div id="in-card-content">
          @forelse($content_ as $key => $content)
          <div class="card mb-3" aria-hidden="true" id="card_0">
            <div class="card-header">
              <div class="form-row">
                <div class="col-md-6">
                  <h6 class="m-0 font-weight-bold text-primary">Chi tiết dự trù</h6>
                </div>
                
                <div class="col-md-6">
                  <button type="button" class="close mr-2 text-danger delete" data-delete="0"><i class="fas fa-minus" title="Xóa nội dung"></i></button>
                  <button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>
                </div>
              </div>
              
            </div>
            <div class="card-body">
              <div class="form-row">
                <div class="form-group cm-inline-form col-2">
                  <label for="accontent_0">Nội dung:</label>
                  <input type="text"  class="form-control" name="content_[]" id="accontent_0" value="{{ $content }}" data-id="0" required>
                </div>
                
                <div class="form-group cm-inline-form col-2">
                  <label for="unit_0">Đơn vị tính:</label>
                  <input type="text"  class="form-control" name="unit_[]" id="unit_[]" data-id="0" value="{{ $unit_[$key] }}">
                </div>
                
                <div class="form-group cm-inline-form col-2">
                  <label for="unitPrice_0">Đơn giá:</label>
                  <input type="text"  class="form-control unitPrice" name="unitPrice_[]" id="unitPrice_0" data-id="0" value="{{ $unitPrice_[$key] }}" required>
                </div>
                
                <div class="form-group cm-inline-form col-2">
                  <label for="amount_0">Số lượng:</label>
                  <input type="number"  class="form-control" name="amount_[]" id="amount_0" data-id="0" value="{{ $amount_[$key] }}" required>
                </div>
                <div class="form-group cm-inline-form col-2">
                  <label for="expectedValue_0">Thành tiền:</label>
                  <input type="text"  class="form-control expectedValue" name="expectedValue_[]" id="expectedValue_0" data-id="0" required>
                </div>
                <div class="form-group cm-inline-form col-2">
                  <label for="paymentType_0">Hình thức thanh toán:</label>
                  <select name="paymentType_[0]" id="paymentType_0" class="form-control" style="width:80%;" data-id="0" required>
                    <option value="Ký nhận">Ký nhận</option>
                    <option value="Hóa đơn đỏ">Hóa đơn đỏ</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          @empty
          <div class="card mb-3" aria-hidden="true" id="card_0">
              <div class="card-header">
                <div class="form-row">
                  <div class="col-md-6">
                    <h6 class="m-0 font-weight-bold text-primary">Chi tiết dự trù</h6>
                  </div>
                  
                  <div class="col-md-6">
                    <button type="button" class="close mr-2 text-danger delete" data-delete="0"><i class="fas fa-minus" title="Xóa nội dung"></i></button>
                    <button type="button" class="close mr-2 text-success add"><i class="fas fa-plus" title="Thêm nội dung"></i></button>
                  </div>
                </div>
                
              </div>
              <div class="card-body">
                <div class="form-row">
                  <div class="form-group cm-inline-form col-2">
                    <label for="accontent_0">Nội dung:</label>
                    <input type="text"  class="form-control" name="content_[]" id="accontent_0"  data-id="0" required>
                  </div>
                  
                  <div class="form-group cm-inline-form col-2">
                    <label for="unit_0">Đơn vị tính:</label>
                    <input type="text"  class="form-control" name="unit_[]" id="unit_[]" data-id="0" >
                  </div>
                  
                  <div class="form-group cm-inline-form col-2">
                    <label for="unitPrice_0">Đơn giá:</label>
                    <input type="text"  class="form-control unitPrice" name="unitPrice_[]" id="unitPrice_0" data-id="0" required>
                  </div>
                  
                  <div class="form-group cm-inline-form col-2">
                    <label for="amount_0">Số lượng:</label>
                    <input type="number"  class="form-control" name="amount_[]" id="amount_0" data-id="0"  required>
                  </div>
                  <div class="form-group cm-inline-form col-2">
                    <label for="expectedValue_0">Thành tiền:</label>
                    <input type="text"  class="form-control expectedValue" name="expectedValue_[]" id="expectedValue_0" data-id="0" required>
                  </div>
                  <div class="form-group cm-inline-form col-2">
                    <label for="paymentType_0">Hình thức thanh toán:</label>
                    <select name="paymentType_[0]" id="paymentType_0" class="form-control" style="width:80%;" data-id="0" required>
                      <option value="Ký nhận">Ký nhận</option>
                      <option value="Hóa đơn đỏ">Hóa đơn đỏ</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          @endforelse
        </div>
        <hr class="sidebar-divider">
        <div class="col-12 text-center">
          <button id="submit" type="submit" class="btn btn-success cm-btn-form">Submit</button>
          <button id="clear" onclick="clearValue()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
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
  <div class="modal animated jackInTheBox" id="activityDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    
  </div>
  @endsection
  @section('js')
  <!-- Page level plugins -->
  <script>
    var BASE_URL = "{{ asset('admin/activities/funding') }}";
    @if(session('error'))
        var error = "{{session('error')}}";
        showNotify('error',error);
    @endif
    @if(session('success'))
        var success = "{{session('success')}}";
        showNotify('success',success);
        var url = "{{route('get_list_activity')}}"
        setTimeout("location.replace(url)", 500);
    @endif
  </script>
  <script src="{{asset('assets/js/admin/fund/add_activity_fund.js')}}"></script>
  @endsection