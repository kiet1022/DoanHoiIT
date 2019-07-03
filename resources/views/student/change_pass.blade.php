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
					<input type="text" class="form-control" id="oldpass" placeholder="Nhập mật khẩu cũ" name="oldpass">
			</div>

			<div class="form-group">
				<label for="newpass">Nhập mật khẩu mới:</label>
					<input type="text" class="form-control" id="newpass" placeholder="Nhập mật khẩu mới" name="newpass">
      </div>
      
      <div class="form-group">
				<label for="renewpass">Nhập lại mật khẩu mới:</label>
					<input type="text" class="form-control" id="renewpass" placeholder="Nhập lại mật khẩu mới" name="renewpass">
      </div>

			<div class="form-group text-center">  
					<button type="submit" class="btn" style="width: 150px;background: #4e73df; color:white">Lưu</button>
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