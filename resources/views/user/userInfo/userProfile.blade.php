@extends('user.layout.layout')
@section('title')
Thông tin cá nhân
@endsection
<!-- <link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css"> -->
<!-- <link href="{{asset('assets/css/admin/sb-admin-2.min.css')}}" rel="stylesheet"> -->
<body>
	@include('user.layout.header')
</body>
	
  
<div class="container ">
    <!-- <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <b>Thông tin sinh viên</b>
                    </div>
                    <div class="card-body">
                        <div class="form-inline ">
                            <label for="sid" class="col-md-4 common-label-inline">MSSV <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <input type="number" class="form-control col-md-8" id="sid" name="sid" placeholder="Mã số sinh viên" readonly value="{{$user->student->student_id}}">
                        </div>
                        <div class="form-inline ">
                            <label for="studentName" class="col-md-4 common-label-inline">Họ tên <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <input type="text" class="form-control col-md-8" id="studentName" name="studentName" placeholder="Họ và Tên" required @if ($errors->any()) value="{{old('studentName')}}" @else  value="{{$user->student->name}}"  @endif >
                        </div>

                        <div class="form-inline ">
                            <label for="studentSex" class="col-md-4 common-label-inline">Giới tính <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <select id="studentSex" class="form-control col-md-8" name="studentSex" required >
                                <option value="1" {{changeSelectedStatus("1","$user->student->sex")}}>Nam</option>
                                <option value="2" {{changeSelectedStatus("2","$user->student->sex")}}>Nữ</option>
                                <option value="3" {{changeSelectedStatus("3","$user->student->sex")}}>Khác</option>
                            </select>
                        </div>
                        
                        <div class="form-inline ">
                            <label for="studentBirthday" class="col-md-4 common-label-inline">Ngày sinh</label>
                            <input type="date" class="form-control" id="birthday" placeholder="Nhập ngay sinh" name="birth_of_date" value="{{$user->student->birthday}}">
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentAddress" class="col-md-4 common-label-inline">Địa chỉ:</label>
                            <input type="text" class="form-control col-md-8" id="studentAddress" name="studentAddress" placeholder="Số nhà, tên đường" @if ($errors->any()) value="{{old('studentAddress')}}" @else  value="{{$user->student->address}}"  @endif>
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentProvince" class="col-md-4 common-label-inline">Tỉnh/Thành:</label>
                            <select id="studentProvince" class="form-control col-md-8" name="studentProvince">
                                <option value="">Vui lòng chọn tỉnh/thành</option>
                                @foreach ($province as $pro)
                                <option value="{!! $pro->id!!}" {{ changeSelectedStatus("$pro->id","$user->student->province") }} >{{ $pro->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentDistrict" class="col-md-4 common-label-inline">Quận/Huyện:</label>
                            <select id="studentDistrict" class="form-control col-md-8" name="studentDistrict">
                                    <option value="">Vui lòng chọn Quận/Huyện</option>
                                @foreach ($district as $dist)
                                <option value="{{ $dist->id }}" {{ changeSelectedStatus("$dist->id","$user->student->district") }} >{{ $dist->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentWard" class="col-md-4 common-label-inline">Xã/Phường/TT:</label>
                            <select id="studentWard" class="form-control col-md-8" name="studentWard">
                                    <option value="">Vui lòng chọn Xã/Phường/TT</option>
                                @foreach ($ward as $wa)
                                <option value="{{ $wa->id }}" {{ changeSelectedStatus("$wa->id","$user->student->ward") }} >{{ $wa->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="form-inline cm-inline-form">
                            <div class="col-sm-10">
                                <p>{{$user->student->image}}</p>
                                @if( !is_null($user->student->image) && $user->student->image !== null && $user->student->image !== "")
                                    <img class="img-profile" src="{{asset('assets/img/students')}}/{{$user->student->image}}" > 
                                @else 
                                    <img class="img-profile" src="{{asset('assets/img/ic-user.png')}}">
                                @endif
                            </div>
                        </div> 
                                               
                        <div class="form-inline cm-inline-form">
                            <label for="studentShoolYear" class="col-md-4 common-label-inline">Niên khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <select id="studentShoolYear" class="form-control col-md-8" name="studentShoolYear" required>
                                @foreach ($schoolYears as $sy)
                                <option value="{{$sy->id}}" {{ changeSelectedStatus("$sy->id","$user->student->school_year_id") }}>{{$sy->course}}</option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentClass" class="col-md-4 common-label-inline">Lớp <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                            <select id="studentClass" class="form-control col-md-8" name="studentClass" required>
                                @foreach ($class as $sy)
                                <option value="{{$sy->id}}" {{ changeSelectedStatus("$sy->id","$user->student->class_id") }}>{{$sy->class_name}}</option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-inline cm-inline-form">
                            <label for="studentPhone" class="col-md-4 common-label-inline">SDT:</label>
                            <input type="number" class="form-control col-md-8" id="studentPhone" name="studentPhone" placeholder="Số điện thoại" maxlength="10" @if ($errors->any()) value="{{old('studentPhone')}}" @else  value="{{$user->student->phone_no}}"  @endif >
                        </div>
                        {{-- is Union --}}
                        <div class="form-inline cm-inline-form">
                            <label for="isUnion" class="col-md-4 common-label-inline">Đoàn viên:</label>
                            <input id="toggleisUnion" name="toggleisUnion" type="checkbox" data-width="120" data-height="20"  @if($user->student->is_youth_union_member == 1) {{"checked value=1"}} @endif>
                        </div>
                        
                        {{-- Union Date --}}
                        <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                            <label for="unionDate" class="col-md-4 common-label-inline">Ngày kết nạp:</label>
                            <div class="col-md-8 px-0">
                                <input style="width: inherit;" id="unionDate" width="100%" class="form-control" name="unionDate" maxlength="10" @if ($errors->any()) value="{{ old('unionDate') }}" @else value="{{ convertToStringDate($user->student->date_on_union) }}" @endif>
                            </div>
                        </div>
                        
                        {{-- UnionPlace --}}
                        <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                            <label for="unionPlace" class="col-md-4 common-label-inline">Nơi kết nạp:</label>
                            <input type="text" class="form-control col-md-8" id="unionPlace" name="unionPlace" placeholder="Nơi kết nạp đoàn" value="">
                        </div>
                        {{-- is Payed Uinon Fee --}}
                        <div class="form-inline cm-inline-form show-off @if ($errors->any()) {{"show-off"}}@endif">
                            <label for="toggleUnionFee" class="col-md-4 common-label-inline">Đoàn phí:</label>
                            <input id="toggleUnionFee" name="toggleUnionFee" type="checkbox" data-width="120" data-height="20"   @if($user->student->is_payed_union_fee == 1) {{"checked  value=1"}}  @endif>
                        </div>
                        
                        {{-- is Study --}}
                        <div class="form-inline cm-inline-form">
                            <label for="isStudy" class="col-md-4 common-label-inline">Tình trạng học tập:</label>
                            <select id="isStudy" class="form-control col-md-8" name="isStudy">
                                <option value="1" @if($user->student->is_study == 1) {{"selected"}} @endif>Còn học</option>
                                <option value="2" @if($user->student->is_study == 2) {{"selected"}} @endif>Đã tốt nghiệp</option>
                                <option value="3" @if($user->student->is_study == 3) {{"selected"}} @endif>Bảo lưu</option>
                                <option value="4" @if($user->student->is_study == 4) {{"selected"}} @endif>Đã nghỉ học</option>
                            </select>
                        </div>                                 
                    </div>
                </div> 
            </div>
        </div>
    </div> -->
    <div class="col-md-12">
        <a href="{{ route('get_edit_info') }}"><button type="button" class="btn">Chỉnh sửa thông tin</button></a>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label" for="name">Họ Tên:</label>
    		<div >
    			<input type="text" class="form-control" id="name" placeholder="Nhập họ tên" name="name" value="{{$user->student->name}}">
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="control-label" for="address">Địa chỉ:</label>
    		<div class="">
    			<input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ" name="address" value="{{$user->student->address}}">
    		</div>
    	</div>
        <div class="form-group">
            <label class="control-label" for="phone">Số CMND:</label>
            <div class="">
                <input type="identity_card" class="form-control" id="identity_card" placeholder="Nhập số điện thoại" name="phone_number" value="{{$user->student->identity_card}}">
            </div>
        </div>
    	<div class="form-group">
    		<label class="control-label" for="phone">Số điện thoại:</label>
    		<div class="">
    			<input type="number" class="form-control" id="phone" placeholder="Nhập số điện thoại" name="phone_number" value="{{$user->student->phone_no}}">
    		</div>
    	</div>
        <div class="form-group">
            <label class="control-label" for="email">Email:</label>
            <div class="">
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" readonly="" value="{{$user->student->name}}">
            </div>
        </div>
    	<div class="form-group">
    		<label class="control-label col-sm-2" for="birthday">Ngày sinh:</label>
    		<div class="col-sm-4">
    			<input type="date" class="form-control" id="birthday" placeholder="Nhập ngay sinh" name="birth_of_date" value="{{$user->student->birthday}}">
    		</div>
    		<label class="control-label col-sm-2" for="sex">Giới tính:</label>
    		<div class="col-sm-4">
    			<select name="sex" id="sex" class="form-control">
    				<option>{!!$user->student->sex !!}</option>
    			</select>
    		</div>
            

    	</div>
    	
    	
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label col-sm-2" for="avatar">Ảnh đại diện</label>
            <div class="col-sm-10">
                @if( !is_null($user->student->image) && $user->student->image !== null && $user->student->image !== "")
                    <img class="img-profile" src="{{asset('assets/img/students')}}/{{$user->student->image}}" > 
                @else 
                    <img class="img-profile" src="{{asset('assets/img/ic-user.png')}}">

                @endif
                </div>
        </div> 
    </div>
    <div class="col-md-12">
        <div class="form-group">  
            <div class="col-sm-offset-1 col-sm-10 text-center">
                 <button type="button" class="btn btn-warning" style="width: 150px;" data-toggle="collapse" data-target="#demo">Đổi mật khẩu</button>
            </div>
        </div>
    </div>
</div>