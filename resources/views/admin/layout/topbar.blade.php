<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
      <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
      <div class="input-group">
          <a href="{{ route('get_home_page') }}"><img src="{{asset('assets/img/faculty_banner.png')}}" alt="" style="width: 25%"></img></a>
      </div>
    </form>
    {{-- <p>Đoàn TN - Hội SV Khoa Công nghệ Thông Tin ĐH SPKT TP.HCM</p> --}}

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

      {{-- <div class="topbar-divider d-none d-sm-block"></div> --}}

      <!-- Nav Item - User Information -->
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ Auth::user()->student->name }}</span>
          <img class="img-profile rounded-circle"  src="{{ asset('assets/img/students/'.Auth::user()->student->image) }}" 
                      onError='this.onerror=null;this.src="{{ asset('assets/img/image-not-available.png') }}";' 
                      alt="Không có hình ảnh" style="max-width: -webkit-fill-available;display: -webkit-inline-box;">
        </a>
        <!-- Dropdown - User Information -->
        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="{{ route('get_user_info') }}">
            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
            Trang cá nhân
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">
            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
            Logout
          </a>
        </div>
      </li>

    </ul>

  </nav>