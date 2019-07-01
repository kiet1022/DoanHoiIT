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
     <link rel="stylesheet" href="pages/css/bootstrap-3.3.6/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="pages/css/font-awesome.min.css">
     <link rel="stylesheet" href="pages/css/owl.carousel.css">
     <link rel="stylesheet" href="pages/css/owl.theme.default.min.css">
     <!-- MAIN CSS -->
     <link rel="stylesheet" href="pages/css/templatemo-style.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="pages/css/font-awesome.min.css">
     <link rel="stylesheet" href="pages/css/pageQuiz.css">
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
     <script src="pages/js/jquery.js"></script>
     <script src="pages/css/bootstrap-3.3.6/dist/js/bootstrap.min.js"></script>
     <script src="pages/js/owl.carousel.min.js"></script>
     <script src="pages/js/smoothscroll.js"></script>
     <script src="pages/js/custom.js"></script>
     @yield('script')
</body>
</html>