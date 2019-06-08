@extends('user.layout.layout')
@section('title')
Thông tin cá nhân
@endsection
<!-- <link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css"> -->
<!-- <link href="{{asset('assets/css/admin/sb-admin-2.min.css')}}" rel="stylesheet"> -->
@section('main_content')


<div class="container ">
    <div class="user-info">
        <div class="col-md-6">
            <div class="form-group">
                <label class="control-label" for="name">Họ Tên:</label>
                <div>
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
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" readonly="" value="{{$user->email}}">
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
                    <img class="img-profile" src="{{asset('assets/img/students')}}/{{$user->student->image}}">
                    @else
                    <img class="img-profile" src="{{asset('assets/img/ic-user.png')}}">

                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10 text-center">
                <a href="{{ route('get_edit_info') }}"><button type="button" class="btn btn-info">Chỉnh sửa thông tin</button></a>
                <!-- <button type="button" class="btn btn-warning" style="width: 150px;" data-toggle="collapse" data-target="#demo">Đổi mật khẩu</button> -->
            </div>
        </div>
    </div>
</div>
@endsection