@extends('student.layout.index')
@section('title')
fff
@endsection
@section('style')
<link rel="stylesheet" href="{{ asset('pages/css/new.css') }}">
@endsection
@section('content')

<!-- section -->
<!-- Page Header -->
<div id="post-header" class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <div class="post-meta">

        	
        </div>

      </div>
    </div>
  </div>
</div>
<!-- /Page Header -->
<!-- container -->
<div class="container">
  <!-- row -->
  <div class="row">
    <!-- Post content -->
    <div class="col-md-8">
      <div class="section-row sticky-container">
        <div class="main-post">
    @foreach($news as $new)
			<div class="col-md-6">
				<div class="post">
					<a class="post-img" href="{{ route('get_new_detail',['id'=>$new->id]) }}"><img style="width: 360px; height: 197px;" src="{{ asset('images/news/'.$new->image) }}" alt="Lỗi"></a>
					<div class="post-body">
						<div class="post-meta">
							<a class="post-category {{changeCatColor($new->ofType->id)}}" href="{{ route('get_new_by_ctg',['id'=>$new->type_id]) }}">{{$new->ofType->name}}</a>
							<br>
							<span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($new->created_at))}}</span>
						</div>
						<h3 class="post-title"><a href="{{ route('get_new_detail',['id'=>$new->id]) }}">{{$new->title}}</a></h3>
					</div>
				</div>
			</div>
			@endforeach
        </div>
        <div class="post-shares sticky-shares">
          <a href="https://www.facebook.com/DoanHoiITUTE/" target="_blank" class="share-facebook"><i class="fa fa-facebook"></i></a>
          <a href="mailto:doaihoiitspkt@gmail.com" class="share-google-plus" target="_blank"><i class="fa fa-google-plus"></i></a>
          <a href="http://fit.hcmute.edu.vn/" class="share-website" target="_blank"><i class="fa fa-globe"></i></a>
        </div>
      </div>                         
    </div>
    <!-- /Post content -->
    
    <!-- aside -->
    <div class="col-md-4">
      <!-- ad -->
      <div class="aside-widget text-center">
        <a href="#" style="display: inline-block;margin: auto;">
          <img class="img-responsive" src="./img/ad-1.jpg" alt="">
        </a>
      </div>
      <!-- /ad -->
      

      <!-- /post widget -->
      
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
								<li><a href="{{ route('get_new_by_ctg',['id'=>$nt->id]) }}" class="{{changeCatColor($nt->id)}}">{{$nt->name}}<span>{{count($nt->news)}}</span></a></li>
								@endforeach
							</ul>
						</div>
					</div>
					<!-- /catagories -->
    </div>
    <!-- /aside -->
  </div>
  <!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /section -->
@endsection
