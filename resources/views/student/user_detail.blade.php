@extends('student.layout.userindex')
@section('title')
{{"Trang cá nhân"}}
@endsection
@section('breadcrumb')
<div class="container">
	<ol class="breadcrumb" style="background-color: #ffffff; margin-bottom: 0px; border-left: 5px solid #4e73df;">
		<li><a href="{{ route('get_home_page') }}" class="text-info">Trang chủ</a></li>
		<li>Thông tin cá nhân</li>
	</ol>
</div>
@endsection
@section('content')
<div class="col-md-9" style="background: white; padding-top: 30px;">
	@if(count($errors)>0)
	<div class="alert alert-warning alert-dismissible show" role="alert">
		@foreach($errors->all() as $err)
		{{$err}}<br>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		@endforeach
	</div>
	@endif
	
	<div class="col-md-10 col-md-offset-1" style="min-height: 437px;">
		<form class="form-horizontal" action="{{ route('post_edit_info') }}" method="post" enctype="multipart/form-data">
			@csrf
			<div class="form-group">
					<label class="control-label col-sm-2" for="sid">MSSV:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="sid" name="sid" value="{{Auth::user()->student->student_id}}" readonly>
					</div>

				<label class="control-label col-sm-2" for="name">Họ Tên:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" placeholder="Nhập họ tên" name="name" value="{{Auth::user()->student->name}}">
				</div>
			</div>

			<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" readonly="" value="{{Auth::user()->email}}">
					</div>
				</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="address">Địa chỉ:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ" name="address" value="{{Auth::user()->student->address}}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone_no">Số điện thoại:</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" id="phone_no" placeholder="Nhập số điện thoại" name="phone_no" value="{{Auth::user()->student->phone_no}}">
				</div>
				<label class="control-label col-sm-2" for="idcard">CMND:</label>
				<div class="col-sm-4">
					<input class="form-control" id="idcard" placeholder="Enter idcard" name="idcard" value="{{Auth::user()->student->identity_card}}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="birthday">Ngày sinh:</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="birthday" placeholder="Nhập địa chỉ" name="birth_of_date" value="{{Auth::user()->student->birthday}}">
				</div>
				<label class="control-label col-sm-2" for="sex">Giới tính:</label>
				<div class="col-sm-4">
					@php
					$sex = Auth::user()->student->sex."";
					@endphp
					<select name="sex" id="sex" class="form-control">
						<option value="1" {{ changeSelectedStatus("1",$sex) }}>Nam</option>
						<option value="2" {{ changeSelectedStatus("2",$sex) }}>Nữ</option>
						<option value="3" {{ changeSelectedStatus("3",$sex) }}>Khác</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="avatar">Ảnh đại diện</label>
				<div class="col-sm-10">
					{{-- <img src="images/admin.jpg" alt="" style="border-radius: 50% !important; width: 20%;"> --}}
					<input id="avatar" type="file" name="image" style="margin-top: 10px;" onchange="loadFile(event)">
					{{-- <img class="image-new" id="output"/> --}}
					<img src="{{ asset('assets/img/students/'.Auth::user()->student->image) }}" class="img-rounded" alt="Cinque Terre" style="width: 30%; margin-top: 10px" id="output">
				</div>
			</div>
			<div class="form-group">  
				<div class="col-sm-offset-1 col-sm-10 text-center">
					<button type="submit" class="btn" style="width: 150px; background: #4e73df; color:white">Lưu</button>
				</div>
			</div>
		</form>
	</div>
</div>
@endsection
@section('js')
<script>
	//load preview image
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};

	$('form').on('submit', function(){
		blockUI(true);
	})

	@if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    console.log(success)
    showNotify('success',success);
    @endif

    $('form').on('submit', function(){
      blockUI(true);
    });
</script>		
@endsection