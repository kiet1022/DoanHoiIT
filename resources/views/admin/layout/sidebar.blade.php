<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

  
  <!-- Divider -->
  <hr class="sidebar-divider my-0">
  
  <!-- Nav Item - Dashboard -->
  <li class="nav-item active">
    <a class="nav-link" href="{{ route('admin_dashboard') }}">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Dashboard</span></a>
    </li>
    
    <!-- Divider -->
    <hr class="sidebar-divider">
    
    {{-- <!-- Heading -->
      <div class="sidebar-heading">
        QUẢN LÝ SINH VIÊN
      </div>
      
      <!-- Divider -->
      <hr class="sidebar-divider"> --}}
      
      <!-- Collapse Student manager -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#studentManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-users"></i>
          <span>Quản lý sinh viên</span>
        </a>
        <div id="studentManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Thông tin sinh viên:</h6>
            <a class="collapse-item" href="{{ route('get_student_list') }}">Danh sách sinh viên</a>
            <a class="collapse-item" href="{{route('get_add_student')}}">Thêm sinh viên</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Thông tin chi đoàn</h6>
            <a class="collapse-item" href="{{route('educationProgramList')}}">Chương trình đào tạo</a>
            <a class="collapse-item" href="{{route('get_class_list')}}">Danh sách chi đoàn</a>
          </div>
        </div>
      </li>
      
      {{-- <!-- Heading -->
        <div class="sidebar-heading">
          QUẢN LÝ HOẠT ĐỘNG
        </div>
        
        <!-- Divider -->
        <hr class="sidebar-divider"> --}}
        
        <!-- Collapse Programs manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#ProgramsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-tasks"></i>
            <span>Quản lý chương trình</span>
          </a>
          <div id="ProgramsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Trước chương trình: </h6>
            <a class="collapse-item" href="{{ route('get_list_activity') }}">Danh sách chương trình</a>
              <a class="collapse-item" href="{{ route('get_add_activity') }}">Thêm chương trình</a>
              <a class="collapse-item" href="{{ route('get_ac_attender_list') }}">Danh sách đăng ký</a>
              <h6 class="collapse-header">Trong chương trình: </h6>
            <a class="collapse-item" href="{{ route('get_workflow_list')}}">Tiến độ công việc</a>
              <a class="collapse-item" href="{{ route('get_add_workflow',['id'=>'null']) }}">Phân công công việc</a>
            <a class="collapse-item" href="{{ route('get_check_in') }}">Điểm danh</a>
              <h6 class="collapse-header">Sau chương trình: </h6>
              <a class="collapse-item" href="404.html">Thanh toán</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse Practise and social marks manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pracSocMarkManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-award"></i>
            <span>Quản lý DRL - CTXH</span>
          </a>
          <div id="pracSocMarkManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{ route('get_marks_list') }}">Quản lý danh sách điểm</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse Funds manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#fundsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-dollar-sign"></i>
            <span>Quản lý dự trù</span>
          </a>
          <div id="fundsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('get_list_funding') }}">Danh sách DTKP</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse Internal manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#internalManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-users-cog"></i>
            <span>Quản lý thông tin BCH</span>
          </a>
          <div id="internalManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{route('get_ec_list')}}">Danh sách BCH</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse User manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#userManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-address-book"></i>
            <span>Quản lý người dùng</span>
          </a>
          <div id="userManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('get_user_list') }}">Danh sách người dùng</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse Statics manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#staticsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-chart-pie"></i>
            <span>Thống kê</span>
          </a>
          <div id="staticsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('st_student_school_year') }}">Tình trạng sinh viên</a>
              <a class="collapse-item" href="{{ route('st_union_fee') }}">Tình trạng đóng đoàn phí</a>
            </div>
          </div>
        </li>
        
        <!-- Collapse news manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#newsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-newspaper"></i>
            <span>Quản lý tin tức</span>
          </a>
          <div id="newsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Loại tin: </h6>
              <a class="collapse-item" href="{{ route('get_news_type_list') }}">Danh sách loại tin</a>
              <a class="collapse-item" href="{{ route('get_add_new_type') }}">Thêm loại tin</a>
              <h6 class="collapse-header">Bài đăng: </h6>
              <a class="collapse-item" href="{{ route('get_news_list') }}">Danh sách bài đăng</a>
              <a class="collapse-item" href="{{ route('get_add_new') }}">Thêm bài đăng</a>
            </div>
          </div>
        </li>
        
        
        <!-- Nav Item - Pages Collapse Menu -->
        {{-- <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Components</span>
          </a>
          <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Custom Components:</h6>
              <a class="collapse-item" href="buttons.html">Buttons</a>
              <a class="collapse-item" href="cards.html">Cards</a>
            </div>
          </div>
        </li> --}}
        
        <!-- Nav Item - Utilities Collapse Menu -->
        {{-- <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-wrench"></i>
            <span>Utilities</span>
          </a>
          <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Custom Utilities:</h6>
              <a class="collapse-item" href="utilities-color.html">Colors</a>
              <a class="collapse-item" href="utilities-border.html">Borders</a>
              <a class="collapse-item" href="utilities-animation.html">Animations</a>
              <a class="collapse-item" href="utilities-other.html">Other</a>
            </div>
          </div>
        </li> --}}
        
        {{-- <!-- Heading -->
          <div class="sidebar-heading">
            QUẢN LÝ THỐNG KÊ
          </div>
          <!-- Divider -->
          <hr class="sidebar-divider"> --}}
          
          {{-- <!-- Nav Item - Charts -->
            <li class="nav-item">
              <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
              </li>
              
              <!-- Nav Item - Tables -->
              <li class="nav-item">
                <a class="nav-link" href="tables.html">
                  <i class="fas fa-fw fa-table"></i>
                  <span>Tables</span></a>
                </li> --}}
                
                
                {{--         
                  <!-- Heading -->
                  <div class="sidebar-heading">
                    QUẢN LÝ NỘI BỘ
                  </div>
                  
                  <!-- Divider -->
                  <hr class="sidebar-divider">
                  
                  
                  <!-- Heading -->
                  <div class="sidebar-heading">
                    QUẢN LÝ TIN TỨC
                  </div>
                  <!-- Divider -->
                  <hr class="sidebar-divider"> --}}
                  
                  <!-- Divider -->
                  <hr class="sidebar-divider d-none d-md-block m-0">
                  <!-- Nav Item - Charts -->
                  <li class="nav-item">
                  <a class="nav-link" href="{{ route('get_logs') }}">
                      <i class="fas fa-history"></i>
                      <span>Activity Logs</span></a>
                  </li>

                  <li class="nav-item">
                      <a class="nav-link" href="{{ route('trash_bin') }}">
                          <i class="fas fa-trash"></i>
                          <span>Trash bin</span></a>
                      </li>
                    <!-- Sidebar Toggler (Sidebar) -->
                    <div class="text-center d-none d-md-inline">
                      <button class="rounded-circle border-0" id="sidebarToggle"></button>
                    </div>
                    
                  </ul>