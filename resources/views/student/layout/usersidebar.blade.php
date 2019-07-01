<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="images/admin.jpg" class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							{{$user->info->name}}
						</div>
						<div class="profile-usertitle-job">
							{{changeRole($user->level)}}
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
							<li @if($check_page == 'info'){!!'class="active"'!!} @endif>
								<a href="{{ route('get_user_info_page',['id'=>$user->id]) }}">
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
							<li @if($check_page == 'result'){!!'class="active"'!!} @endif>
								<a href="{{route('get_user_test_result',['iduser'=>$user->id])}}">
									<i class="glyphicon glyphicon-ok"></i>
								Kết quả thi </a>
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