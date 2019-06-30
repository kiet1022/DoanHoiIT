@extends('admin.layout.layout')
@section('title')
Thêm sinh viên
@endsection
@section('style')
@endsection
@section('main_content')
<div class="row">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><i class="fas fa-home"></i><a href="{{ route('admin_dashboard') }}"> Dashboard</a></li>
      <li class="breadcrumb-item"><i class="fas fa-angle-right"></i> Quản lý sinh viên</li>
      <li class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="{{ route('get_student_list') }}"> Danh sách sinh viên</a></li>
      <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-angle-right"></i> Thêm sinh viên</li>
    </ol>
  </nav>
</div>
<div class="row">
  <div class="col page-title-header">
    <h4>Nhập thông tin sinh viên</h4>
  </div>
</div>
<div class="row">
  <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 custom_panel">
    <form id="formAddStudent" action="{{ route('post_add_student') }}" method="POST">
      <div class="form-row">
        @csrf
        {{-- Basic info --}}
        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
          <div class="card">
            <div class="card-header">
              <b>Thông tin cơ bản</b>
            </div>
            <div class="card-body">
              {{-- Student ID --}}
              <div class="form-inline cm-inline-form">
                <label for="sid" class="col-md-4 common-label-inline">MSSV <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <input type="number" class="form-control col-md-8" id="sid" name="sid" placeholder="Mã số sinh viên" required value="{{old('sid')}}">
              </div>
              
              {{-- error --}}
              @if ($errors->get('sid'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('sid') as $sid)
                  <li>{{$sid}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
              {{-- Student Name --}}
              <div class="form-inline cm-inline-form">
                <label for="studentName" class="col-md-4 common-label-inline">Họ tên <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <input type="text" class="form-control col-md-8" id="studentName" name="studentName" placeholder="Họ và Tên" required value="{{old('studentName')}}">
              </div>
              
              {{-- error --}}
              @if ($errors->get('studentName'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('studentName') as $studentName)
                  <li>{{$studentName}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
              {{-- Sex --}}
              <div class="form-inline cm-inline-form">
                <label for="studentSex" class="col-md-4 common-label-inline">Giới tính <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <select id="studentSex" class="form-control col-md-8" name="studentSex" required >
                  <option value="1" {{changeSelectedStatus("1",old('studentSex'))}}>Nam</option>
                  <option value="2" {{changeSelectedStatus("2",old('studentSex'))}}>Nữ</option>
                  <option value="3" {{changeSelectedStatus("3",old('studentSex'))}}>Khác</option>
                </select>
              </div>
              
              {{-- error --}}
              @if ($errors->get('studentSex'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('studentSex') as $studentSex)
                  <li>{{$studentSex}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
              {{-- Birthday --}}
              <div class="form-inline cm-inline-form">
                <label for="studentBirthday" class="col-md-4 common-label-inline">Ngày sinh <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <div class="col-md-8 px-0">
                  <input style="width: inherit;" id="studentBirthday" width="100%" class="form-control" name="studentBirthday" maxlength="10" required value="{{ old('studentBirthday') }}"  >
                </div>
              </div>
              
              {{-- error --}}
              @if ($errors->get('studentBirthday'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('studentBirthday') as $studentBirthday)
                  <li>{{$studentBirthday}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
              {{-- Address --}}
              <div class="form-inline cm-inline-form">
                <label for="studentAddress" class="col-md-4 common-label-inline">Địa chỉ:</label>
                <input type="text" class="form-control col-md-8" id="studentAddress" name="studentAddress" placeholder="Nhập địa chỉ" value="{{old('studentAddress')}}">
              </div>
              
              {{-- <div class="form-inline cm-inline-form">
                <label for="studentProvince" class="col-md-4 common-label-inline">Tỉnh/Thành:</label>
                <select id="studentProvince" class="form-control col-md-8" name="studentProvince">
                  @foreach ($province as $prov)
                  <option value="{!! $prov->id !!}" {{changeSelectedStatus("$prov->id",old('studentProvince'))}}>{{ $prov->name }}</option>
                  @endforeach
                </select>
              </div> --}}
              
              {{-- <div class="form-inline cm-inline-form">
                <label for="studentDistrict" class="col-md-4 common-label-inline">Quận/Huyện:</label>
                <select id="studentDistrict" class="form-control col-md-8" name="studentDistrict">
                  @foreach ($district as $dist)
                  <option value="{{ $dist->id }}" {{changeSelectedStatus("$dist->id",old('studentDistrict'))}}>{{ $dist->name }}</option>
                  @endforeach
                </select>
              </div> --}}
              
              {{-- <div class="form-inline cm-inline-form">
                <label for="studentWard" class="col-md-4 common-label-inline">Xã/Phường/TT:</label>
                <select id="studentWard" class="form-control col-md-8" name="studentWard">
                  @foreach ($ward as $wa)
                  <option value="{{ $wa->id }}" {{changeSelectedStatus("$wa->id",old('studentWard'))}}>{{ $wa->name }}</option>
                  @endforeach
                </select>
              </div> --}}

            </div>
          </div>
        </div>
        
        {{-- Advanced info --}}
        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
          <div class="card">
            <div class="card-header">
              <b>Thông tin thêm</b>
            </div>
            <div class="card-body">
              {{-- Shool year --}}
              <div class="form-inline cm-inline-form">
                <label for="studentShoolYear" class="col-md-4 common-label-inline">Niên khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <select id="studentShoolYear" class="form-control col-md-8" name="studentShoolYear" required>
                  @foreach ($schoolYears as $sy)
                  <option value="{{$sy->id}}" {{changeSelectedStatus("$sy->id",old('studentShoolYear'))}}>{{$sy->course}}</option>
                  @endforeach
                </select>
              </div>
              {{-- error --}}
              @if ($errors->get('studentShoolYear'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('studentShoolYear') as $studentShoolYear)
                  <li>{{$studentShoolYear}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              {{-- Class --}}
              <div class="form-inline cm-inline-form">
                <label for="studentClass" class="col-md-4 common-label-inline">Lớp <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                <select id="studentClass" class="form-control col-md-8" name="studentClass" required>
                  @foreach ($class as $sy)
                  <option value="{{$sy->id}}" {{changeSelectedStatus("$sy->id",old('studentClass'))}}>{{$sy->class_name}}</option>
                  @endforeach
                </select>
              </div>
              {{-- error --}}
              @if ($errors->get('studentClass'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('studentClass') as $studentClass)
                  <li>{{$studentClass}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              {{-- Phone number --}}
              <div class="form-inline cm-inline-form">
                <label for="studentPhone" class="col-md-4 common-label-inline">SDT:</label>
                <input type="number" class="form-control col-md-8" id="studentPhone" name="studentPhone" placeholder="Số điện thoại" maxlength="10" value="{{old('studentPhone')}}">
              </div>
              {{-- is Union --}}
              <div class="form-inline cm-inline-form">
                <label for="isUnion" class="col-md-4 common-label-inline">Đoàn viên:</label>
                <input id="toggleisUnion" name="toggleisUnion" type="checkbox" data-width="120" data-height="20" value="0">
              </div>
              
              {{-- Union Date --}}
              <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                <label for="unionDate" class="col-md-4 common-label-inline">Ngày kết nạp:</label>
                <div class="col-md-8 px-0">
                  <input style="width: inherit;" id="unionDate" width="100%" class="form-control" name="unionDate" maxlength="10" value="{{ old('unionDate') }}">
                </div>
              </div>
              
              {{-- error --}}
              @if ($errors->get('unionDate'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('unionDate') as $unionDate)
                  <li>{{$unionDate}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
              {{-- UnionPlace --}}
              <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                <label for="unionPlace" class="col-md-4 common-label-inline">Nơi kết nạp:</label>
                <input type="text" class="form-control col-md-8" id="unionPlace" name="unionPlace" placeholder="Nơi kết nạp đoàn" value="{{old('unionPlace')}}">
              </div>
              {{-- is Payed Uinon Fee --}}
              <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                <label for="toggleUnionFee" class="col-md-4 common-label-inline">Đoàn phí:</label>
                <input id="toggleUnionFee" name="toggleUnionFee" type="checkbox" data-width="120" data-height="20"  value="0">
              </div>
              
              {{-- is Study --}}
              
              <div class="form-inline cm-inline-form">
                <label for="isStudy" class="col-md-4 common-label-inline">Tình trạng học tập:</label>
                <select id="isStudy" class="form-control col-md-8" name="isStudy">
                  <option value="1" {{changeSelectedStatus("1",old('isStudy'))}}>Còn học</option>
                  <option value="2" {{changeSelectedStatus("2",old('isStudy'))}}>Đã tốt nghiệp</option>
                  <option value="3" {{changeSelectedStatus("3",old('isStudy'))}}>Bảo lưu</option>
                  <option value="4" {{changeSelectedStatus("4",old('isStudy'))}}>Đã nghỉ học</option>
                </select>
              </div>
              
              {{-- error --}}
              @if ($errors->get('isStudy'))
              <div class="form-inline cm-inline-form cm-error">
                <ul class="col-md-8 offset-md-4 cm-ul-error">
                  @foreach ($errors->get('isStudy') as $isStudy)
                  <li>{{$isStudy}}</li>
                  @endforeach
                </ul>
              </div>
              @endif
              
            </div>
          </div> 
        </div>
      </div>
      <hr class="sidebar-divider">
      <div class="col-12 text-center">
        <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
        <button id="clear" onclick="clearValue()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
      </div>
    </form>
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
</div>
@endsection
@section('js')
<script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
<script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
<script>
  $(document).on('submit','form#formAddStudent',function(){
    $(document).ajaxStart($.blockUI({ message: '<div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status"><span class="sr-only">Loading...</span></div>', 
    css: {backgroundColor: 'transparent',border: 'none'} })).ajaxStop($.unblockUI);
  });
  
  // global variable
  var classes = {!!$class!!};

  @if(session('error'))
      var error = "{{session('error')}}";
      showNotify('error',error);
    @endif
  @if(session('success'))
      var success = "{{session('success')}}";
      showNotify('success',success);
  @endif
    </script>
    <script src="{{asset('assets/js/admin/add_student.js')}}"></script>
    @endsection