<!DOCTYPE html>
<html lang="en">
<head>
     
     <title>@yield('title')</title>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <base href="{{ asset('') }}">
     <link rel="stylesheet" href="{{ asset('pages/css/bootstrap-3.3.6/dist/css/bootstrap.min.css') }}">
     <link rel="stylesheet" href="pages/css/font-awesome.min.css">
     <link rel="stylesheet" href="pages/css/owl.carousel.css">
     <link rel="stylesheet" href="pages/css/owl.theme.default.min.css">
     <!-- MAIN CSS -->
     <link rel="stylesheet" href="pages/css/templatemo-style.css">
     <link rel="stylesheet" href="{{ asset('pages/css/userinfo.css') }}">
     <link rel="stylesheet" href="{{ asset('assets/vendor/animate.css-master/animate.min.css') }}">
     <link rel="stylesheet" href="{{ asset('pages/css/font-awesome.min.css')}}">
     <link rel="stylesheet" href="{{ asset('assets/vendor/bootstrap4-dialog/css/bootstrap-dialog.min.css') }}" >
     <style>
          .dropdown:hover .dropdown-menu {
               display: block;
          }
     </style>
     @yield('style')
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
     <!-- MENU -->
     @include('student.layout.header')
     <!-- HOME -->
     @yield('extends')
     <section style="padding-top: 20px; padding-bottom: 20px;" id="register">
          @yield('breadcrumb')
          <div class="container">
               <div class="row profile">
                    @include('student.layout.usersidebar')
                    @yield('content')
               </div>
          </div>
     </section>
     <!-- ABOUT -->
     <!-- FOOTER -->
     @include('student.layout.footer')
     <!-- SCRIPTS -->
     <script src="pages/js/jquery.js"></script>
     <script src="{{ asset('pages/css/bootstrap-3.3.6/dist/js/bootstrap.min.js') }}"></script>
     <script src="pages/js/owl.carousel.min.js"></script>
     <script src="pages/js/smoothscroll.js"></script>
     <script src="pages/js/custom.js"></script>
     <script src="{{asset('assets/vendor/bootstrap-notify-master/bootstrap-notify.min.js')}}"></script>
     <script src="{{asset('assets/vendor/bootstrap4-dialog/js/bootstrap-dialog.min.js')}}"></script>
     <script src="{{asset('assets/vendor/jquery.blockUI.js')}}"></script>
     <script src="{{ asset('assets/js/common.js') }}"></script>
     @yield('js')
</body>
</html>