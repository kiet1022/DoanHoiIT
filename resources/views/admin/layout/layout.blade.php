<!DOCTYPE html>
<html lang="en">

<head>
  
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  {{-- <base href="{{asset('')}}"> --}}
  <title>@yield('title')</title>
  <link rel="shortcut icon" href="{{asset('assets/img/faculty_banner.png')}}"> 
  <!-- Custom fonts for this template-->
  <link href="{{asset('assets/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
  <!-- Custom styles for this template-->
  <link href="{{asset('assets/css/admin/sb-admin-2.min.css')}}" rel="stylesheet">
  <link href="{{asset('assets/vendor/bootstrap-select-1.13.7/dist/css/bootstrap-select.min.css')}}" rel="stylesheet">
<link rel="stylesheet" href="{{ asset('assets/vendor/animate.css-master/animate.min.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendor/bootstrap4-dialog/css/bootstrap-dialog.min.css') }}" >
  @yield('style')
</head>

<body id="page-top">
  
  <!-- Page Wrapper -->
  <div id="wrapper">
    
    <!-- Sidebar -->
    @include('admin.layout.sidebar')
    <!-- End of Sidebar -->
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
        <!-- Topbar -->
        @include('admin.layout.topbar')
        <!-- End of Topbar -->
        
        <!-- Begin Page Content -->
        <div class="container-fluid">
          
          <!-- Page Heading -->
          {{-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div> --}}
          @yield('main_content')
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      
      <!-- Footer -->
      @include('admin.layout.footer')
      <!-- End of Footer -->
      
    </div>
    <!-- End of Content Wrapper -->
    
  </div>
  <!-- End of Page Wrapper -->
  
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <!-- Logout Modal-->
  @include('admin.layout.logout_model')
  
  <!-- Bootstrap core JavaScript-->
  <script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  
  <!-- Core plugin JavaScript-->
  <script src="{{asset('assets/vendor/jquery-easing/jquery.easing.min.js')}}"></script>
  
  <!-- Custom scripts for all pages-->
  <script src="{{asset('assets/vendor/sb-admin-2.min.js')}}"></script>
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
