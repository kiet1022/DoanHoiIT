@extends('student.layout.index')
@section('title')
{{"Tin tức"}}
@endsection
@section('style')
<link rel="stylesheet" href="pages/css/homepagenews.css">
@endsection
@section('content')
<section id="news">
	<div class="section" style="padding-top: 0">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				{{-- Tin tức --}}
				<div class="col-md-7">
					<div class="row" style="display: flex; flex-wrap: wrap;">
						<!-- Tin lớn -->
						<div class="col-md-12">
							<div class="post post-thumb">
								<a class="post-img" href=""><img style="width: 750px; height: 410px;" src="{{ asset('images/news/'.$newNews[0]->image) }}" alt="Lỗi"></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category {{changeCatColor($newNews[0]->ofType->id)}}" href="category.html">{{$newNews[0]->ofType->name}}</a>
										<span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($newNews[0]->created_at))}}</span>
									</div>
									<h3 class="post-title"><a href="">{{$newNews[0]->title}}</a></h3>
								</div>
							</div>
						</div>
						
						{{-- Hôm nay có gì mới --}}
						<div class="col-md-12 text-center" style="margin-bottom: 15px">
							<div class="col-md-4 badge-header-primary">
								<h4 style="color: white; margin: 5px">Hôm nay có gì mới</h4>
							</div>
							<div class="col-md-12" style="border-bottom: 2px solid #4e73df;">
							</div>
						</div>
						<!-- Các tin con -->
						@foreach($news as $new)
						<div class="col-md-6">
							<div class="post">
								<a class="post-img" href=""><img style="width: 360px; height: 197px;" src="{{ asset('images/news/'.$new->image) }}" alt="Lỗi"></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category {{changeCatColor($new->ofType->id)}}" href="category.html">{{$new->ofType->name}}</a>
										<br>
										<span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($new->created_at))}}</span>
									</div>
									<h3 class="post-title"><a href="">{{$new->title}}</a></h3>
								</div>
							</div>
						</div>
						@endforeach
						
						{{-- Hoạt động Đoàn - Hội khoa --}}
						<div class="col-md-12 text-center" style="margin-bottom: 15px">
							<div class="col-md-5 badge-header-success">
								<h4 style="color: white; margin: 5px">Hoạt động Đoàn - Hội khoa</h4>
							</div>
							<div class="col-md-12" style="border-bottom: 2px solid #1cc88a;">
							</div>
						</div>
						<!-- Các tin con -->
						@foreach($news as $new)
						<div class="col-md-6">
							<div class="post">
								<a class="post-img" href=""><img style="width: 360px; height: 197px;" src="{{ asset('images/news/'.$new->image) }}" alt="Lỗi"></a>
								<div class="post-body">
									<div class="post-meta">
										<a class="post-category {{changeCatColor($new->ofType->id)}}" href="category.html">{{$new->ofType->name}}</a>
										<br>
										<span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($new->created_at))}}</span>
									</div>
									<h3 class="post-title"><a href="">{{$new->title}}</a></h3>
								</div>
							</div>
						</div>
						@endforeach
					</div>
				</div>
				
				{{-- Chương trình sắp tới --}}
				<div class="col-md-5">
					<div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
						<div class="col-md-6 badge-header-warning">
							<h4 style="color: white; margin: 5px">Chương trình sắp tới</h4>
						</div>
						<div class="col-md-12" style="border-bottom: 2px solid #f4b619 ;">
						</div>
					</div>
					<div class="aside-widget">
						{{-- <div class="section-title" style="margin-bottom: 0;padding-bottom: 0;">
							<h2>Chương trình sắp tới</h2>
						</div> --}}
						@foreach($activities as $act)
						<div class="post post-widget">
							<a class="post-img" href=""><img style="width: 90px; height: 49px;" src="{{ asset('images/news/'.$newNews[0]->image) }}" alt="Lỗi"></a>
							<div class="post-body">
								<h3 class="post-title"><a href="">{{$act->name}}</a></h3>
								<span class="post-date">Thời gian: {{date('d/m/Y',strtotime($act->start_date))}} - {{date('d/m/Y',strtotime($act->end_date))}}</span>
							</div>
						</div>
						@endforeach
					</div>
					
					
					<!-- catagories -->
					<div class="aside-widget">
						<div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
							<div class="col-md-6 badge-header-danger">
								<h4 style="color: white; margin: 5px">Danh mục tin tức</h4>
							</div>
							<div class="col-md-12" style="border-bottom: 2px solid #e74a3b ;">
							</div>
						</div>
						{{-- <div class="section-title" style="margin-bottom: 0;padding-bottom: 0;">
							<h2>Danh mục tin tức</h2>
						</div> --}}
						<div class="category-widget">
							<ul>
								@foreach($newsType as $nt)
								<li><a href="#" class="{{changeCatColor($nt->id)}}">{{$nt->name}}<span>{{count($nt->news)}}</span></a></li>
								@endforeach
							</ul>
						</div>
					</div>
					<!-- /catagories -->
					
					<!-- catagories -->
					<div class="aside-widget">
						<div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
							<div class="col-md-6 badge-header-info">
								<h4 style="color: white; margin: 5px">Kết nối với chúng tôi</h4>
							</div>
							<div class="col-md-12" style="border-bottom: 2px solid #36b9cc ;">
							</div>
						</div>
						{{-- <div class="section-title" style="margin-bottom: 0;padding-bottom: 0;">
							<h2>Danh mục tin tức</h2>
						</div> --}}
						<div class="category-widget col-md-12" style="display: flex; flex-wrap: wrap;">
							<div class="col-md-4 socialite facebook-background">
								<a href="https://www.facebook.com/DoanHoiITUTE/" class="text-white" target="_blank">
										<i class="fa fa-facebook"></i>
										<span>
											3K
											<br>
											Người theo dõi
										</span>
								</a>
							</div>

							<div class="col-md-4 socialite google-background">
									<a href="mailto:doaihoiitspkt@gmail.com" class="text-white" target="_blank">
											<i class="fa fa-google-plus"></i>
											<span>
													Liên hệ
												<br>
												Thư điện tử
											</span>
									</a>
								</div>

								<div class="col-md-4 socialite faculty-background">
										<a href="http://fit.hcmute.edu.vn/" class="text-white" target="_blank">
												<i class="fa fa-globe"></i>
												<span>
													Truy cập
													<br>
													Website
												</span>
										</a>
									</div>
						</div>
					</div>
					<!-- /catagories -->
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
</section>
@endsection
