     <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
          <div class="container">
               <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                    </button>
                    
                    <!-- lOGO TEXT HERE -->
                    <a href="{{route('get_home_page')}}" class="navbar-brand"><img src="{{asset('assets/img/faculty_banner.png')}}" alt="" style="width: 20%"></a>
               </div>
               
               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                         <li><a href="#news" style="padding: 0;"><a href="" class="smoothScroll">Trang chủ</a></a></li>
                         {{--                          <li><a href="#forum" style="padding: 0;"><a href="{{route('get_forum_page')}}" class="smoothScroll">Diễn Đàn</a></a></li> --}}
                         {{--                          <li><a href="#about" class="smoothScroll">Về chúng tôi</a></li> --}}
                         {{--                          <li><a href="#contact" class="smoothScroll">Liên hệ</a></li> --}}
                         <li><a href="#test" style="padding: 0;"><a href="" class="smoothScroll">Làm bài thi</a></a></li>
                         
                    </ul>
                    @guest
                    <ul class="nav navbar-nav navbar-right">
                         {{--  <li><a href="#register" style="padding: 0;"><a href="{{route('get_register_page')}}">Đăng ký</a></a></li> --}}
                         <li><a href="" style="padding: 0;"><a href="{{ route('get_login') }}" class="smoothScroll">Đăng nhập</a></a></li>
                    </ul>
                    @endguest
                    @auth
                    <ul class="nav navbar-nav navbar-right">
                              <li class="dropdown">
                                   <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{Auth::user()->student->name}}</a>
                                   <ul class="dropdown-menu clearfix" role="menu">
                                        <li><a href="">Trang cá nhân</a></li>
                                        @if(Auth::user()->level == 1)
                                        <li><a href="{{route("admin_dashboard")}}">Trang quản trị</a></li>
                                        @endif
                                   </ul>
                              </li>
                              <li>
                                   <a href="#login" style="padding: 0;">
                                        <a href="{{route('logout')}}" class="smoothScroll">Đăng Xuất</a>
                                   </a>
                              </li>
                         </ul>
                         @endauth
                    </div>
               </div>
          </section>