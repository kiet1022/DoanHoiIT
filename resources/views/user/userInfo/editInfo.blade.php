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
    <form id="formEditStudent" action="{{ route('post_edit_info') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="col-md-6">
<!--         	<div class="form-group">
        		<label class="control-label" for="name">Họ Tên:</label>
        		<div >
        			<input type="text" class="form-control" id="name" placeholder="Nhập họ tên" name="name" value="{{$user->student->name}}">
        		</div>
        	</div> -->
        	<div class="form-group">
        		<label class="control-label" for="address">Địa chỉ:</label>
        		<div class="">
        			<input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ" name="address" value="{{$user->student->address}}">
        		</div>
        	</div>
            <div class="form-group">
                <label class="control-label" for="identity_card">Số CMND:</label>
                <div class="">
                    <input type="identity_card" class="form-control" id="identity_card" placeholder="Nhập số điện thoại" name="identity_card" value="{{$user->student->identity_card}}">
                </div>
            </div>
        	<div class="form-group">
        		<label class="control-label" for="phone_number">Số điện thoại:</label>
        		<div class="">
        			<input type="number" class="form-control" id="phone_number" placeholder="Nhập số điện thoại" name="phone_number" value="{{$user->student->phone_no}}">
        		</div>
        	</div>
            <div class="form-group">
                <label class="control-label" for="email">Email:</label>
                <div class="">
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" readonly="" value="{{$user->student->name}}">
                </div>
            </div>
        	<div class="form-group">
        		<label class="control-label col-sm-2" for="studentBirthday">Ngày sinh:</label>
        		<div class="col-sm-4">
        			<input type="date" class="form-control" id="studentBirthday" placeholder="Nhập ngay sinh" name="studentBirthday" value="{{$user->student->birthday}}">
        		</div>
        	</div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label class="control-label col-sm-2" for="avatar">Ảnh đại diện</label>
                <div class="col-sm-10">
                    @if( !is_null($user->student->image) && $user->student->image !== null && $user->student->image !== "")
                        <img class="img-profile" src="{{asset('assets/img/students')}}/{{$user->student->image}}" id="output" > 
                    @else 
                        <img class="img-profile" src="{{asset('assets/img/ic-user.png')}}" id="output">
                    @endif
                </div>
                <input type="file" name="image" id="image" onchange="loadFile(event)">
            </div> 
        </div>
        <div class="col-md-12">
            <div class="form-group">  
                <div class="col-sm-offset-1 col-sm-10 text-center">
                    <a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><button type="button" class="btn btn-warning" name="cancel" style="width: 150px;"  >Hủy</button></a>
                    <button type="submit" class="btn btn-success" name="submit" style="width: 150px;"  >Lưu</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var loadFile = function(event) {
        var output = document.getElementById('output');
        output.src = URL.createObjectURL(event.target.files[0]);
    };

</script>