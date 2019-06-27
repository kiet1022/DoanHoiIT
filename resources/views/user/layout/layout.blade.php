<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>@yield('title')</title>
  <link rel="shortcut icon" href="{{asset('assets/img/faculty_banner.png')}}">

  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="{{asset('assets/css/user/bootstrap.min.css')}}" />
  <link rel="stylesheet" href="{{asset('assets/css/user/font-awesome.min.css')}}">
  <link type="text/css" rel="stylesheet" href="{{asset('assets/css/user/style.css')}}" />
  <link href="{{asset('assets/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">

  <!-- <script src="{{asset('assets/vendor/bootstrap-select-1.13.7/dist/js/bootstrap-select.min.js')}}"></script> -->
  <!-- <script src="{{asset('assets/vendor/bootstrap-notify-master/bootstrap-notify.min.js')}}"></script> -->
  <!-- <script src="{{asset('assets/vendor/bootstrap4-dialog/js/bootstrap-dialog.min.js')}}"></script> -->

  <!-- <link href="{{asset('assets/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css"> -->

  <!-- Custom styles for this template-->
  <!-- <link href="{{asset('assets/vendor/bootstrap-select-1.13.7/dist/css/bootstrap-select.min.css')}}" rel="stylesheet"> -->
  <!-- <link rel="stylesheet" href="{{ asset('assets/vendor/animate.css-master/animate.min.css') }}"> -->
  <!-- <link rel="stylesheet" href="{{ asset('assets/vendor/bootstrap4-dialog/css/bootstrap-dialog.min.css') }}"> -->
  @yield('style')
</head>

<body>
  <header id="header">
    <!-- NAV -->
    <div id="nav">
      <!-- Top Nav -->
      <div id="nav-top">
        <div class="container">
          <!-- social -->
   <!--        <ul class="nav-social">
            <li><a href="https://www.facebook.com/DoanHoiITUTE" target="_blank"><i class="fa fa-facebook"></i></a></li>
          </ul> -->
          @auth
          <div class="auth-header row form-inline cm-inline-form ">
            <p> SV. {{Auth::user()->student->name}}</p>
            <span>
              @if( !is_null(Auth::user()->student->image) && Auth::user()->student->image !== null && Auth::user()->student->image !== "" && Auth::user()->student->image !== "null")
              <img class="img-small" src="{{asset('assets/img/students')}}/{{Auth::user()->student->image}}">
              @else
              <img class="img-small" src="{{asset('assets/img/ic-user.png')}}">
              @endif
          </div>
          @endauth
        </div>
      </div>
      <!-- /Top Nav -->

      <!-- Main Nav -->
      <div id="nav-bottom">
        <div class="container">
          <!-- nav -->
          <ul class="nav-menu">
            <li> <a href="{{ route('get_home_page') }}">Trang chủ</a></li>
            <li><a href="{{ route('get_new_by_ctg', ['id'=>'all']) }}">Danh mục</a></li>
            <li><a href="http://fit.hcmute.edu.vn" target="_blank">Khoa CNTT</a></li>
            <li><a href="{{ route('get_list_activity_user') }}">Chương trình</a></li>
            @auth
            <li><a href="{{ route('get_profile') }}">Thông tin cá nhân</a></li>
            <li><a href="{{ route('logout') }}">Đăng xuất</a></li>
            @endauth
            @guest
            <li><a href="{{ route('get_login') }}">Đăng nhập</a></li>
            @endguest

          </ul>
          <!-- /nav -->
        </div>
      </div>
      <!-- /Main Nav -->

      <!-- Aside Nav -->
      <div id="nav-aside">
        <ul class="nav-aside-menu">
          <li><a href="{{ route('get_home_page') }}">Home</a></li>
          <li><a href="{{ route('get_new_by_ctg', ['id'=>'all']) }}">Danh mục</a></li>
          <li><a href="http://fit.hcmute.edu.vn" target="_blank">Khoa CNTT</a></li>
          <li><a href="{{ route('get_list_activity_user') }}">Chương trình</a></li>
          @auth
          <li><a href="{{ route('get_profile') }}">Thông tin cá nhân</a></li>
          <li><a href="{{ route('logout') }}">Đăng xuất</a></li>
          @endauth
          @guest
          <li><a href="{{ route('get_login') }}">Đăng nhập</a></li>
          @endguest
        </ul>
        <button class="nav-close nav-aside-close"><span></span></button>
      </div>
      <!-- /Aside Nav -->
    </div>
    <!-- /NAV -->
  </header>

  @yield('main_content')

  @extends('user.layout.footer')

  <!-- <script src="{{asset('assets/js/user/jquery.min.js')}}"></script> -->
  <script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('assets/vendor/sb-admin-2.min.js')}}"></script>
  <script src="{{asset('assets/vendor/jquery-easing/jquery.easing.min.js')}}"></script>
  <!-- <script src="{{asset('assets/js/user/bootstrap.min.js')}}"></script>
  <script src="{{asset('assets/js/user/jquery.stellar.min.js')}}"></script>
  <script src="{{asset('assets/js/user/main.js')}}"></script> -->
  <script src="{{asset('assets/vendor/bootstrap-select-1.13.7/dist/js/bootstrap-select.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap-notify-master/bootstrap-notify.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap4-dialog/js/bootstrap-dialog.min.js')}}"></script>
  <script src="{{asset('assets/vendor/jquery.blockUI.js')}}"></script>
  <script src="{{ asset('assets/js/common.js') }}"></script>
  <script>
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
  </script>
  @yield('js')
</body>

</html>