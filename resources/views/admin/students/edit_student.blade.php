@extends('admin.layout.layout')
@section('title')
Danh sách sinh viên
@endsection
@section('style')
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/vendor/icheck-1.x/skins/flat/green.css')}}" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href="{{asset('assets/vendor/gijgo-combined-1.9.11/css/gijgo.min.css')}}" rel="stylesheet">
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Nhập thông tin sinh viên</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_student',['id'=>$student->student_id]) }}" method="POST">
            @csrf
            <div class="form-row">
                {{-- Basic info --}}
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <b>Thông tin cơ bản</b>
                        </div>
                        <div class="card-body">
                            {{-- Student ID --}}
                            <div class="form-inline cm-inline-form">
                                <label for="sid" class="col-md-4 common-label-inline">MSSV <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="number" class="form-control col-md-8" id="sid" name="sid" placeholder="Mã số sinh viên" required disabled value="{{$student->student_id}}">
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
                                <input type="text" class="form-control col-md-8" id="studentName" name="studentName" placeholder="Họ và Tên" required @if ($errors->any()) value="{{old('studentName')}}" @else  value="{{$student->name}}"  @endif >
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
                            <!-- {{-- authorities --}}
                            <div class="form-inline cm-inline-form">
                                <label for="permistion" class="col-md-4 common-label-inline">Quyền <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="permistion" class="form-control col-md-8" name="permistion" required >
                                    <option value="0" @if($student->user->level == 0) {{"selected"}} @endif>Sinh viên</option>
                                    <option value="1" @if($student->user->level == 1) {{"selected"}} @endif>Thường trực</option>
                                    <option value="2" @if($student->user->level == 2) {{"selected"}} @endif>Ủy viên</option>
                                    <option value="3" @if($student->user->level == 3) {{"selected"}} @endif>Ban cán sự lớp</option>
                                </select>
                            </div> -->
                            {{-- Sex --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentSex" class="col-md-4 common-label-inline">Giới tính <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="studentSex" class="form-control col-md-8" name="studentSex" required >
                                    <option value="1" @if($student->sex == 1) {{"selected"}} @endif>Nam</option>
                                    <option value="2" @if($student->sex == 2) {{"selected"}} @endif>Nữ</option>
                                    <option value="3" @if($student->sex == 3) {{"selected"}} @endif>Khác</option>
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
                                    <input id="studentBirthday" width="100%" class="form-control" name="studentBirthday" maxlength="10" required @if ($errors->any()) value="{{old('studentBirthday')}}" @else  value="{{$student->birthday}}"  @endif  >
                                </div>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('studentBirthday'))
                            <div class="form-inline cm-inline-form">
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
                                <input type="text" class="form-control col-md-8" id="studentAddress" name="studentAddress" placeholder="Số nhà, tên đường" @if ($errors->any()) value="{{old('studentAddress')}}" @else  value="{{$student->address}}"  @endif>
                            </div>
                            
                            <div class="form-inline cm-inline-form">
                                <label for="studentProvince" class="col-md-4 common-label-inline">Tỉnh/Thành:</label>
                                <select id="studentProvince" class="form-control col-md-8" name="studentProvince">
                                    @foreach ($data["province"] as $province)
                                    <!-- <option value="{!! $province->id !!}" @if($student->provine ==$province->name) {{"selected"}}  @endif>{{ $province->name }}</option> -->
                                    <option value="{!! $province->id!!}" @if( $student->province ==($province->id)) {{"selected"}}  @endif>{{ $province->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-inline cm-inline-form">
                                <label for="studentDistrict" class="col-md-4 common-label-inline">Quận/Huyện:</label>
                                <select id="studentDistrict" class="form-control col-md-8" name="studentDistrict">
                                    @foreach ($data["district"] as $district)
                                    <option value="{{ $district->id }}" @if( $student->district ==($district->id)) {{"selected"}}  @endif>{{ $district->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-inline cm-inline-form">
                                <label for="studentWard" class="col-md-4 common-label-inline">Xã/Phường/TT:</label>
                                <select id="studentWard" class="form-control col-md-8" name="studentWard">
                                    @foreach ($data["ward"] as $ward)
                                    <option value="{{ $ward->id }}" @if( $student->ward ==($ward->id)) {{"selected"}}  @endif>{{ $ward->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Advanced info --}}
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <b>Thông tin thêm</b>
                        </div>
                        <div class="card-body">
                            {{-- Shool year --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentShoolYear" class="col-md-4 common-label-inline">Niên khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="studentShoolYear" class="form-control col-md-8" name="studentShoolYear" required>
                                    @foreach ($data["schoolYears"] as $sy)
                                    <option value="{{$sy->id}}"  @if($student->school_year_id == $sy->id) {{"selected"}} @endif>{{$sy->course}}</option>
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
                                    @foreach ($data["class"] as $sy)
                                    <option value="{{$sy->id}}" @if($student->class_id == $sy->id) {{"selected"}} @endif>{{$sy->class_name}}</option>
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
                                <input type="number" class="form-control col-md-8" id="studentPhone" name="studentPhone" placeholder="Số điện thoại" maxlength="10" @if ($errors->any()) value="{{old('studentPhone')}}" @else  value="{{$student->phone_no}}"  @endif >
                            </div>
                            {{-- is Union --}}
                            <div class="form-inline cm-inline-form">
                                <label for="isUnion" class="col-md-4 common-label-inline">Đoàn viên:</label>
                                <input id="toggleisUnion" name="toggleisUnion" type="checkbox" data-width="120" data-height="20"  @if($student->is_youth_union_member == 1) {{"checked value=1"}} @endif>
                            </div>

                            {{-- Union Date --}}
                            <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                                <label for="unionDate" class="col-md-4 common-label-inline">Ngày kết nạp:</label>
                                <div class="col-md-8 px-0">
                                    <input id="unionDate" width="100%" class="form-control" name="unionDate" maxlength="10" value="{{$student->date_on_union}}">
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
                                <input type="text" class="form-control col-md-8" id="unionPlace" name="unionPlace" placeholder="Nơi kết nạp đoàn" value="">
                            </div>
                            {{-- is Payed Uinon Fee --}}
                            <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                                <label for="toggleUnionFee" class="col-md-4 common-label-inline">Đoàn phí:</label>
                                <input id="toggleUnionFee" name="toggleUnionFee" type="checkbox" data-width="120" data-height="20"   @if($student->is_payed_union_fee == 1) {{"checked  value=1"}}  @endif>
                            </div>

                            {{-- is Study --}}
                            <div class="form-inline cm-inline-form">
                                <label for="isStudy" class="col-md-4 common-label-inline">Tình trạng học tập:</label>
                                <select id="isStudy" class="form-control col-md-8" name="isStudy">
                                    <option value="1" @if($student->is_study == 1) {{"selected"}} @endif>Còn học</option>
                                    <option value="2" @if($student->is_study == 2) {{"selected"}} @endif>Đã tốt nghiệp</option>
                                    <option value="3" @if($student->is_study == 3) {{"selected"}} @endif>Bảo lưu</option>
                                    <option value="4" @if($student->is_study == 4) {{"selected"}} @endif>Đã nghỉ học</option>
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
                <button type="button" class="btn btn-warning cm-btn-form">Cancel</button>
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/vendor/icheck-1.x/icheck.js')}}"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="{{asset('assets/vendor/gijgo-combined-1.9.11/js/gijgo.js')}}"></script>

<script>
    // global variable
    var classes = {!!$data["class"]!!};
    var province = {!! $data["province"]!!}
    var district = {!! $data["district"]!!}
    var ward = {!! $data["ward"]!!}
    var message = '';
    @if(session('success'))
    $.notify({
        // options
        message:'{{session('success')}}',
    },{
        // settings
        type: "success",
        newest_on_top: true,
        offset: {
            x: 20,
            y: 80
        },
        spacing: 10,
        z_index: 1031,
        delay: 4000,
        timer: 500,
        animate: {
            enter: 'animated flipInY',
            exit: 'animated flipOutX'
        },
        template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
            '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
            '<span data-notify="icon"></span> ' +
            '<span data-notify="title">{1}</span> ' +
            '<span data-notify="message">{2}</span>' +
            '<div class="progress" data-notify="progressbar">' +
                '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                '</div>' +
                '<a href="{3}" target="{4}" data-notify="url"></a>' +
                '</div>' 
            });
            @endif
        </script>
        <script src="{{asset('assets/js/admin/add_student.js')}}"></script>
        @endsection