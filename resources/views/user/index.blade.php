@extends('user.layout.layout')
@section('title')
Trang chu
@endsection

<body>
  <!-- HEADER -->
  @include('user.layout.header')
  <!-- /HEADER -->

  <!-- SECTION -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div id="hot-post" class="row hot-post">
        <div class="col-md-8 hot-post-left">
          <!-- post -->
          <div class="post post-thumb">
            <a class="post-img" href="{{ route('get_new',['id'=>$lastedNews1->id]) }}">
              @if($lastedNews1->image != "") 
                <img src="{{asset('images/news')}}/{{$lastedNews1->image}}" alt="">
              @else 
                <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
              @endif</a>
            <div class="post-body">
              <div class="post-category">
                <a href="category.html">{{$lastedNews1->ofType->name}}</a>
              </div>
              <h3 class="post-title title-lg"><a href="{{ route('get_new',['id'=>$lastedNews1->id]) }}">{{$lastedNews1->title}}</a></h3>
              <ul class="post-meta">
                <li><a href="author.html">{{$lastedNews1->ofUser->student->name}}</a></li>
                <li>{{$lastedNews1->created_at->format('F j Y')}}</li>
              </ul>
            </div>
          </div>
          <!-- /post -->
        </div>
        <div class="col-md-4 hot-post-right">
          <!-- post -->
          <div class="post post-thumb">
            <a class="post-img" href="{{ route('get_new',['id'=>$lastedNews2->id]) }}">
              @if($lastedNews2->image != "") 
              <img src="{{asset('images/news')}}/{{$lastedNews2->image}}" alt="">
            @else 
                <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
              @endif</a>
            <div class="post-body">
              <div class="post-category">
                <a href="category.html">{{$lastedNews2->ofType->name}}</a>
              </div>
              <h3 class="post-title"><a href="{{ route('get_new',['id'=>$lastedNews2->id]) }}">{{$lastedNews2->title}}</a></h3>
              <ul class="post-meta">
                <li><a href="author.html">{{$lastedNews2->ofUser->student->name}}</a></li>
                <li>{{$lastedNews2->created_at->format('F j Y')}}</li>
              </ul>
            </div>
          </div>
          <!-- /post -->

          <!-- post -->
          <div class="post post-thumb">
            <a class="post-img" href="{{ route('get_new',['id'=>$lastedNews3->id]) }}">
              @if($lastedNews3->image != "") 
              <img src="{{asset('images/news')}}/{{$lastedNews3->image}}" alt="">
            @else 
                <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
              @endif</a>
            <div class="post-body">
              <div class="post-category">
                <a href="category.html">{{$lastedNews3->ofType->name}}</a>
              </div>
              <h3 class="post-title"><a href="{{ route('get_new',['id'=>$lastedNews3->id]) }}">{{$lastedNews3->title}}</a></h3>
              <ul class="post-meta">
                <li><a href="author.html">{{$lastedNews3->ofUser->student->name}}</a></li>
                <li>{{$lastedNews3->created_at->format('F j Y')}}</li>
              </ul>
            </div>
          </div>
          <!-- /post -->
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /SECTION -->

  <!-- SECTION -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-8">
          <!-- row -->
          <div class="row">
            <div class="col-md-12">
              <div class="section-title">
                <h2 class="title">Recent posts</h2>
              </div>
            </div>
            <!-- post -->
            @foreach ($news as $list)
            <div class="col-md-6">
              <div class="post">
                <a class="post-img" href="{{ route('get_new',['id'=>$list->id]) }}">
                  @if($list->image != "") 
                  <img src="{{asset('images/news')}}/{{$list->image}}" alt="">
                  @else 
                              <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
                   @endif
                </a>
                <div class="post-body">
                  <div class="post-category">
                    <a href="category.html">{{$list->ofType->name}}</a>
                  </div>
                  <h3 class="post-title"><a href="blog-post.html">{{$list->title}}</a></h3>
                  <ul class="post-meta">
                    <li><a href="author.html">{{$list->ofUser->student->name}}</a></li>
                    <li>{{$list->created_at->format('F j Y')}}</li>
                  </ul>
                </div>
              </div>
            </div>
            @endforeach
            <!-- /post -->
          </div>
          <!-- /row -->
        </div>
        @include('user.layout.sideBarRight')
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /SECTION -->

  <!-- SECTION -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-8">
          <div class="section-row loadmore text-center">
            <a href="#" class="primary-button">Load more</a>
          </div>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /SECTION -->



    @extends('user.layout.footer')