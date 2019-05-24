@extends('user.layout.layout')
@section('title')
Trang chu
@endsection

<body>
  @include('user.layout.header')

  
<!-- SECTION -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-8">

          <!-- post -->
           @foreach ($news as $list)
          <div class="post post-row">
            <a class="post-img" href="{{ route('get_new',['id'=>$list->id]) }}">
              @if($list->image != "") 
                  <img src="{{asset('images/news')}}/{{$list->image}}" alt="">
                  @else 
                              <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
                   @endif
            </a>
            <div class="post-body">
              <div class="post-category">
                <a href="category.html">Travel</a>
              </div>
              <h3 class="post-title"><a href="{{ route('get_new',['id'=>$list->id]) }}">{{$list->title}}</a></h3>
              <ul class="post-meta">
                <li><a href="#">{{$list->ofUser->student->name}}</a></li>
                <li>{{$list->created_at->format('F j Y')}}</li>
              </ul>
              <p>{{$list->sumary}}</p>
            </div>
          </div>
          @endforeach
          <!-- /post -->
        </div>

        @include('user.layout.sideBarRight')
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /SECTION -->



  @extends('user.layout.footer')