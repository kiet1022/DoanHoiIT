@extends('student.layout.userindex')
@section('title')
{{"Đổi mật khẩu"}}
@endsection
@section('breadcrumb')
<div class="container">
	<ol class="breadcrumb" style="background-color: #ffffff; margin-bottom: 0px; border-left: 5px solid #4e73df;">
		<li><a href="{{ route('get_home_page') }}" class="text-info">Trang chủ</a></li>
    <li>Thông tin cá nhân</li>
    <li>Đổi mật khẩu</li>
	</ol>
</div>
@endsection
@section('style')

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
		<form action="{{ route('post_user_change_pass') }}" method="post">
			@csrf
			<div class="form-group">
					<label for="oldpass">Nhập mật khẩu cũ:</label>
					<input type="password" class="form-control" id="oldpass" placeholder="Nhập mật khẩu cũ" name="oldpass" required>
			</div>

			<div class="form-group">
				<label for="newpass">Nhập mật khẩu mới:</label>
					<input type="password" class="form-control" id="newpass" placeholder="Nhập mật khẩu mới" name="newpass" required>
      </div>
      
      <div class="form-group">
				<label for="renewpass">Nhập lại mật khẩu mới:</label>
					<input type="password" class="form-control input" id="renewpass" placeholder="Nhập lại mật khẩu mới" name="renewpass" required>
					<span style="display: none" id="notmatch"><small style="color:red">Mật khẩu mới chưa trùng khớp</small></span>
			</div>

			<div class="form-group text-center">  
					<button id="btnsubmit" type="submit" class="btn" style="width: 150px;background: #4e73df; color:white">Lưu</button>
			</div>
		</form>
	</div>
</div>
@endsection
@section('js')
<script>
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

	// Check if new password not match
	$('.input').on('keyup', function(e){
		var newpass = $('#newpass').val();
		if(newpass != e.target.value){
			$(this).css({"outline": "none !important","border":"1px solid red","box-shadow": "0 0 10px #719ECE"});
			$('#btnsubmit').attr("disabled",true);
			$('#notmatch').css({"display":"block"});
		} else if(newpass === e.target.value){
			$(this).css({"outline": "none !important","border":"1px solid green","box-shadow": "0 0 10px #719ECE"});
			$('#btnsubmit').attr("disabled",false);
			$('#notmatch').css({"display":"none"});
		}
	});
</script>		
@endsection