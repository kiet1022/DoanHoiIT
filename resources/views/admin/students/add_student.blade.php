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
    <form action="{{ route('post_add_student') }}" method="POST">
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
                                <input type="number" class="form-control col-md-8" id="sid" name="sid" placeholder="Mã số sinh viên" required>
                            </div>
                            {{-- Student Name --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentName" class="col-md-4 common-label-inline">Họ tên <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="studentName" name="studentName" placeholder="Họ và Tên" required>
                            </div>
                            {{-- Sex --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentSex" class="col-md-4 common-label-inline">Giới tính <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="studentSex" class="form-control col-md-8" name="studentSex" required>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                    <option value="3">Khác</option>
                                </select>
                            </div>
                            {{-- Birthday --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentBirthday" class="col-md-4 common-label-inline">Ngày sinh <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <div class="col-md-8 px-0">
                                    <input id="studentBirthday" width="100%" class="form-control" name="studentBirthday" maxlength="10" required/>
                                </div>
                            </div>
                            {{-- Address --}}
                            <div class="form-inline cm-inline-form">
                                    <label for="studentAddress" class="col-md-4 common-label-inline">Địa chỉ:</label>
                                    <input type="text" class="form-control col-md-8" id="studentAddress" name="studentAddress" placeholder="Số nhà, tên đường">
                                </div>

                            <div class="form-inline cm-inline-form">
                                <label for="studentProvince" class="col-md-4 common-label-inline">Tỉnh/Thành:</label>
                                <select id="studentProvince" class="form-control col-md-8" name="studentProvince">
                                    @foreach ($data["province"] as $province)
                                    <option value="{!! $province->id !!}">{{ $province->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-inline cm-inline-form">
                                <label for="studentDistrict" class="col-md-4 common-label-inline">Quận/Huyện:</label>
                                <select id="studentDistrict" class="form-control col-md-8" name="studentDistrict">
                                    @foreach ($data["province"][0]->districts as $district)
                                    <option value="{{ $district->id }}">{{ $district->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-inline cm-inline-form">
                                <label for="studentWard" class="col-md-4 common-label-inline">Xã/Phường/TT:</label>
                                <select id="studentWard" class="form-control col-md-8" name="studentWard">
                                    @foreach ($data["district"][0]->wards as $ward)
                                    <option value="{{ $ward->id }}">{{ $ward->name }}</option>
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
                                    <option value="{{$sy->id}}">{{$sy->course}}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{-- Class --}}
                            <div class="form-inline cm-inline-form">
                                <label for="studentClass" class="col-md-4 common-label-inline">Lớp <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="studentClass" class="form-control col-md-8" name="studentClass" required>
                                    <option value="1">151101</option>
                                    <option value="2">151102</option>
                                    <option value="3">151103</option>
                                    <option value="4">159100</option>
                                </select>
                            </div>
                            {{-- Phone number --}}
                            <div class="form-inline cm-inline-form">
                                    <label for="studentPhone" class="col-md-4 common-label-inline">SDT:</label>
                                    <input type="number" class="form-control col-md-8" id="studentPhone" name="studentPhone" placeholder="Số điện thoại" maxlength="10">
                                </div>
                            {{-- is Union --}}
                            <div class="form-inline cm-inline-form">
                                <label for="isUnion" class="col-md-4 common-label-inline">Đoàn viên:</label>
                                <input id="toggleisUnion" name="toggleisUnion" type="checkbox" data-width="120" data-height="20">
                            </div>
                            {{-- Union Date --}}
                            <div class="form-inline cm-inline-form show-off">
                                <label for="unionDate" class="col-md-4 common-label-inline">Ngày kết nạp:</label>
                                <div class="col-md-8 px-0">
                                    <input id="unionDate" width="100%" class="form-control" name="unionDate" maxlength="10"/>
                                </div>
                            </div>
                            {{-- UnionPlace --}}
                            <div class="form-inline cm-inline-form show-off">
                                <label for="unionPlace" class="col-md-4 common-label-inline">Nơi kết nạp:</label>
                                <input type="text" class="form-control col-md-8" id="unionPlace" name="unionPlace" placeholder="Nơi kết nạp đoàn">
                            </div>
                            {{-- is Payed Uinon Fee --}}
                            <div class="form-inline cm-inline-form show-off">
                                <label for="toggleUnionFee" class="col-md-4 common-label-inline">Đoàn phí:</label>
                                <input id="toggleUnionFee" name="toggleUnionFee" type="checkbox" data-width="120" data-height="20" checked>
                            </div>
                            {{-- is Study --}}
                            <div class="form-inline cm-inline-form">
                                <label for="isStudy" class="col-md-4 common-label-inline">Tình trạng học tập:</label>
                                <select id="isStudy" class="form-control col-md-8" name="isStudy">
                                    <option value="1">Còn học</option>
                                    <option value="2">Đã tốt nghiệp</option>
                                    <option value="3">Bảo lưu</option>
                                    <option value="4">Đã nghỉ học</option>
                                </select>
                            </div>
                            
                        </div>
                    </div> 
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
                <button id="clear" onclick="notify()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
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