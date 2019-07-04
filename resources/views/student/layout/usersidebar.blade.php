<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="{{ asset('assets/img/students/'.Auth::user()->student->image) }}" class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							{{Auth::user()->student->name}}
						</div>
						<div class="profile-usertitle-job">
							{{-- {{changeRole($user->level)}} --}}
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
{{-- 					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Follow</button>
						<button type="button" class="btn btn-danger btn-sm">Message</button>
					</div> --}}
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li @if($status === "info"){!!'class="active"'!!} @endif>
								<a href="">
									<i class="glyphicon glyphicon-home"></i>
								Thông tin chung </a>
							</li>
	{{-- 						<li @if($check_page == 'addtest'){!!'class="active"'!!} @endif>
								<a href="{{route('get_add_test_by_user')}}">
									<i class="glyphicon glyphicon-user"></i>
								Tạo bài thi </a>
							</li>
							<li @if($check_page == 'testadded'){!!'class="active"'!!} @endif>
								<a href="{{route('get_test_added')}}">
									<i class="glyphicon glyphicon-user"></i>
								Các bài thi đã tạo </a>
							</li> --}}
							<li @if($status === "changepass"){!!'class="active"'!!} @endif>
								<a href="{{ route('get_user_change_pass') }}">
									<i class="glyphicon glyphicon-wrench"></i>
								Đổi mật khẩu</a>
							</li>

							<li @if($status === "registedac"){!!'class="active"'!!} @endif>
									<a href="{{ route('get_registed_ac') }}">
										<i class="	glyphicon glyphicon-list-alt"></i>
									Chương trình đã đăng ký</a>
							</li>
	{{-- 						<li>
								<a href="#">
									<i class="glyphicon glyphicon-flag"></i>
								Help </a>
							</li> --}}
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>