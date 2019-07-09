@extends('student.layout.index')
@section('title')
{{$detail->title}}
@endsection
@section('style')
<link rel="stylesheet" href="{{ asset('pages/css/new.css') }}">
@endsection
@section('content')

<!-- section -->
<!-- Page Header -->
<div id="post-header" class="page-header">
  @if($detail->image!=null && $detail->image!="")
  <div class="background-img" style="background-image: url('{{ asset('images/news/'.$detail->image) }}');"></div>
  @endif
  <div class="container">
    <div class="row">
      <div class="col-md-10">
        <div class="post-meta">
          <a class="post-category {{changeCatColor($detail->type_id)}}" href="{{ route('get_new_by_ctg',['id'=>$detail->type_id]) }}">{{$detail->ofType->name}}</a>
          <span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($detail->created_at))}}</span>
        </div>
        <h1>{{$detail->title}}</h1>
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
          {!! $detail->content !!}
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
      
      <!-- post widget -->
      <div class="aside-widget">
        <div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
          <div class="col-md-7 badge-header-warning">
            <h4 style="color: white; margin: 5px">Bài viết cùng chủ đề</h4>
          </div>
          <div class="col-md-12" style="border-bottom: 2px solid #f4b619 ;">
          </div>
        </div>
        @foreach($relatedPost as $rl)
        <div class="post post-thumb">
          <a class="post-img" href="{{ route('get_new_detail',['id'=>$rl->id]) }}">
            <img src="{{ asset('images/news/'.$rl->image) }}" alt="Lỗi" style="width: 360px; height: 197px;">
          </a>
          <div class="post-body">
            <div class="post-meta">
              <a class="post-category {{changeCatColor($rl->type_id)}}" href="">{{$rl->ofType->name}}</a>
              <span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($rl->created_at))}}</span>
            </div>
            <h3 class="post-title"><a href="{{ route('get_new_detail',['id'=>$rl->id]) }}">{{$rl->title}}</a></h3>
          </div>
        </div>
        @endforeach
      </div>
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
