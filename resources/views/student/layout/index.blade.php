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
     <link rel="shortcut icon" href="{{asset('assets/img/faculty_banner.png')}}"> 
     <base href="{{ asset('') }}">
     <link rel="stylesheet" href="{{ asset('pages/css/bootstrap-3.3.6/dist/css/bootstrap.min.css')}}">
     <link rel="stylesheet" href="{{ asset('pages/css/font-awesome.min.css')}}">
     <link rel="stylesheet" href="{{ asset('pages/css/owl.carousel.css')}}">
     <link rel="stylesheet" href="{{ asset('pages/css/owl.theme.default.min.css')}}">
     {{-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> --}}
     <!-- MAIN CSS -->
     <link rel="stylesheet" href="{{ asset('pages/css/templatemo-style.css')}}">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="{{ asset('assets/vendor/animate.css-master/animate.min.css') }}">
     <link rel="stylesheet" href="{{ asset('pages/css/font-awesome.min.css')}}">
     <link rel="stylesheet" href="{{ asset('assets/vendor/bootstrap4-dialog/css/bootstrap-dialog.min.css') }}" >
     @yield('style')
     <style>
          .dropdown:hover .dropdown-menu {
               display: block;
          }
     </style>
</head>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
     <!-- PRE LOADER -->
     <!-- MENU -->
     @include('student.layout.header')
     <!-- HOME -->
     @yield('extends')
     
     <!-- ABOUT -->
     @yield('content')
     <!-- FOOTER -->
     @include('student.layout.footer')
     <!-- SCRIPTS -->
     <script src="{{ asset('pages/js/jquery.js')}}"></script>
     <script src="{{ asset('pages/css/bootstrap-3.3.6/dist/js/bootstrap.min.js')}}"></script>
     <script src="{{ asset('pages/js/owl.carousel.min.js')}}"></script>
     <script src="{{ asset('pages/js/smoothscroll.js')}}"></script>
     <script src="{{ asset('pages/js/custom.js')}}"></script>
     <script src="{{asset('assets/vendor/bootstrap-notify-master/bootstrap-notify.min.js')}}"></script>
     <script src="{{asset('assets/vendor/bootstrap4-dialog/js/bootstrap-dialog.min.js')}}"></script>
     <script src="{{asset('assets/vendor/jquery.blockUI.js')}}"></script>
     <script src="{{ asset('assets/js/common.js') }}"></script>
     @yield('js')
</body>
</html>