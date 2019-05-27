@extends('user.layout.layout')
@section('title')
Bài viết
@endsection

<body>
  @include('user.layout.header')
    <div id="post-header" class="page-header">
      @if($news->image != "") 
      <div class="page-header-bg" style="background-image: url('{{asset('images/news')}}/{{$news->image}}');" data-stellar-background-ratio="0.5"></div>

     @endif
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <div class="post-category">
              <a href="{{ route('get_new_by_ctg',['id'=>$news->ofType->id]) }}">{{$news->ofType->name}}</a>
            </div>
            <h1>{{$news->title}}</h1>
            <ul class="post-meta">
              <li><a href="author.html">{{$news->ofUser->student->name}}</a></li>
              <li>{{$news->created_at->format('F j Y')}}</li>
              <li><i class="fa fa-comments"></i> 3</li>
              <li><i class="fa fa-eye"></i> 807</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- /PAGE HEADER -->
  <!-- section -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-8">
          <!-- post share -->
          <div class="section-row">
            <div class="post-share">
              <a href="#" class="social-facebook"><i class="fa fa-facebook"></i><span>Share</span></a>
              <a href="#" class="social-twitter"><i class="fa fa-twitter"></i><span>Tweet</span></a>
              <a href="#" class="social-pinterest"><i class="fa fa-pinterest"></i><span>Pin</span></a>
              <a href="#" ><i class="fa fa-envelope"></i><span>Email</span></a>
            </div>
          </div>
          <!-- /post share -->

          <!-- post content -->
          <div class="section-row">
            {!!$news->content!!}
          </div>
          <!-- /post content -->

          <!-- /related post -->
          <div>
            <div class="section-title">
              <h3 class="title">Related Posts</h3>
            </div>
            <div class="row">
              <!-- post -->
              @foreach ($relatedPost as $list)
              <div class="col-md-4">
                <div class="post post-sm">
                  <a class="post-img" href="{{ route('get_new',['id'=>$list->id]) }}">
                    @if($list->image != "") 
                  <img src="{{asset('images/news')}}/{{$list->image}}" alt="">
                  @else 
                              <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
                   @endif
                  </a>
                  <div class="post-body">
                    <div class="post-category">
                      <a href="{{ route('get_new_by_ctg',['id'=>$list->ofType->id]) }}">{{$list->ofType->name}}</a>
                    </div>
                    <h3 class="post-title title-sm"><a href="blog-post.html">{{$list->title}}</a></h3>
                    <ul class="post-meta">
                      <li><a href="author.html">John Doe</a></li>
                      <li>20 April 2018</li>
                    </ul>
                  </div>
                </div>
              </div>
              @endforeach
              <!-- /post -->
            </div>
          </div>
          <!-- /related post -->
        </div>
        @include('user.layout.sideBarRight')
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /SECTION -->
  @extends('user.layout.footer')