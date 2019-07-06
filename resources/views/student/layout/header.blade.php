     <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
          <div class="container">
               <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                    </button>
                    
                    <!-- lOGO TEXT HERE -->
                    <a href="{{route('get_home_page')}}" class="navbar-brand" style="padding: 10px;"><img src="{{asset('assets/img/faculty_banner.png')}}" alt="" style="width: 25%"></a>
               </div>
               
               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    @guest
                    <ul class="nav navbar-nav navbar-right">
                         {{--  <li><a href="#register" style="padding: 0;"><a href="{{route('get_register_page')}}">Đăng ký</a></a></li> --}}
                         <li><a href="" style="padding: 0;"><a href="{{ route('get_login') }}" class="smoothScroll">Đăng nhập</a></a></li>
                    </ul>
                    @endguest
                    @auth
                    <ul class="nav navbar-nav navbar-right">
                              <li class="dropdown">
                                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{Auth::user()->student->name}}</a>
                                   <ul class="dropdown-menu clearfix" role="menu">
                                        <li><a href="{{ route('get_user_info') }}">Trang cá nhân</a></li>
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