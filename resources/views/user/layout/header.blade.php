<header id="header">
    <!-- NAV -->
    <div id="nav">
      <!-- Top Nav -->
      <div id="nav-top">
        <div class="container">
          <!-- social -->
          <ul class="nav-social">
            <li><a href="https://www.facebook.com/DoanHoiITUTE" target="_blank"><i class="fa fa-facebook"></i></a></li>
          </ul>
          <!-- /social -->

          <!-- logo -->
       <!--    <div class="nav-logo">
            <a href="{{ route('get_home_page') }}" class="logo"><img src="{{asset('assets/img/faculty_banner.png')}}" alt=""></a>
          </div> -->
          <!-- /logo -->

          <!-- search & aside toggle -->
         <!--  <div class="nav-btns">
            <button class="aside-btn"><i class="fa fa-bars"></i></button>
            <button class="search-btn"><i class="fa fa-search"></i></button>
            <div id="nav-search">
              <form>
                <input class="input" name="search" placeholder="Enter your search...">
              </form>
              <button class="nav-close search-close">
                <span></span>
              </button>
            </div>
          </div> -->
          <!-- /search & aside toggle -->
          @auth
            <div class="auth-header row form-inline cm-inline-form ">
              <p> SV. {{Auth::user()->student->name}}</p>
              <span>
                @if( !is_null(Auth::user()->student->image) && Auth::user()->student->image !== null && Auth::user()->student->image !== "")
                    <img class="img-small" src="{{asset('assets/img/students')}}/{{Auth::user()->student->image}}" > 
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
            <li><a href="{{ route('get_new_by_ctg', ['id'=>'all']) }}" >Danh mục</a></li>
            <li><a href="http://fit.hcmute.edu.vn" target="_blank" >Khoa CNTT</a></li>
            <li><a href="{{ route('get_list_activity') }}">Chương trình</a></li>
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
            <li><a href="http://fit.hcmute.edu.vn" target="_blank" >Khoa CNTT</a></li>
            <li><a href="{{ route('get_list_activity') }}">Chương trình</a></li>
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