@extends('user.layout.layout')
@section('title')
Danh mục tin
@endsection

@section('main_content')
  <!-- PAGE HEADER -->
    <div class="page-header">
      <div class="page-header-bg" style="background-image: url('{{asset('assets/img/user/banner.jpg')}}');" data-stellar-background-ratio="0.5"></div>
      <div class="container">
        <div class="row">
          <div class="col-md-offset-1 col-md-10 text-center">
            <h1 class="text-uppercase"></h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /PAGE HEADER -->
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
              <a>
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
              <h3 class="post-title"><a href="">{{$list->title}}</a></h3>
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
  @endsection