<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>

  <!-- Custom fonts for this template-->
  <link href="{{asset('assets/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="{{ asset('assets/vendor/animate.css-master/animate.min.css') }}">
  <!-- Custom styles for this template-->
  <link href="{{asset('assets/css/admin/sb-admin-2.min.css')}}" rel="stylesheet">
<style>
    .container-fluid{
        width: 500px;
    height: 300px;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    }
</style>
</head>

<body>
    <div class="container-fluid">
        <!-- 404 Error Text -->
        <div class="text-center">
          <div class="error mx-auto text-danger animated infinite heartBeat" data-text="404">404</div>
          <p class="lead text-gray-800 mb-5">Page Not Found</p>
          {{-- <p class="text-gray-500 mb-0">Trang không tồn tại....</p> --}}
          <a href="index.html">&larr; Trở về trang chủ</a>
        </div>
      </div>
<!-- Bootstrap core JavaScript-->
<script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>
<script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

<!-- Core plugin JavaScript-->
<script src="{{asset('assets/vendor/jquery-easing/jquery.easing.min.js')}}"></script>

<!-- Custom scripts for all pages-->
<script src="{{asset('assets/vendor/sb-admin-2.min.js')}}"></script>

</body>

</html>
