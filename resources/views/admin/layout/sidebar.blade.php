<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  
  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">THƯỜNG TRỰC <sup>(P. Bí thư)</sup></div>
  </a>
  
  <!-- Divider -->
  <hr class="sidebar-divider my-0">
  
  <!-- Nav Item - Dashboard -->
  <li class="nav-item active">
    <a class="nav-link" href="index.html">
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
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý sinh viên</span>
          </a>
          <div id="studentManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Thông tin sinh viên:</h6>
              <a class="collapse-item" href="login.html">Danh sách sinh viên</a>
              <a class="collapse-item" href="register.html">Thêm sinh viên</a>
              <a class="collapse-item" href="forgot-password.html">DRL - CTXH</a>
              <div class="collapse-divider"></div>
              <h6 class="collapse-header">Thông tin chi đoàn</h6>
              <a class="collapse-item" href="404.html">Danh sách chi đoàn</a>
              <a class="collapse-item" href="blank.html">Danh sách đoàn viên</a>
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
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý chương trình</span>
          </a>
          <div id="ProgramsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Trước chương trình: </h6>
              <a class="collapse-item" href="login.html">Kế hoạch</a>
              <a class="collapse-item" href="register.html">Dự trù</a>
              <h6 class="collapse-header">Trong chương trình: </h6>
              <a class="collapse-item" href="404.html">Tiến độ công việc</a>
              <a class="collapse-item" href="blank.html">Danh sách đăng kí</a>
              <a class="collapse-item" href="blank.html">Điểm danh</a>
              <h6 class="collapse-header">Sau chương trình: </h6>
              <a class="collapse-item" href="404.html">Thanh toán</a>
            </div>
          </div>
        </li>

        <!-- Collapse Practise and social marks manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pracSocMarkManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý DRL - CTXH</span>
          </a>
          <div id="pracSocMarkManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="login.html">Quản lý danh sách điểm</a>
              <a class="collapse-item" href="404.html">Xuất danh sách</a>
            </div>
          </div>
        </li>

        <!-- Collapse Funds manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#fundsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý kinh phí</span>
          </a>
          <div id="fundsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Theo năm: </h6>
              <a class="collapse-item" href="login.html">Danh sách</a>
              <div class="collapse-divider"></div>
              <h6 class="collapse-header">Theo chương trình: </h6>
              <a class="collapse-item" href="login.html">Danh sách</a>
              <h6 class="collapse-header">Tổng hợp thu chi: </h6>
              <a class="collapse-item" href="404.html">Tổng hợp</a>
            </div>
          </div>
        </li>

        <!-- Collapse Internal manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#internalManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý thông tin BCH</span>
          </a>
          <div id="internalManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="login.html">Danh sách BCH</a>
            </div>
          </div>
        </li>

        <!-- Collapse User manager -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#userManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>Quản lý người dùng</span>
          </a>
          <div id="userManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="login.html">Quản lý Users</a>
              <a class="collapse-item" href="login.html">Phân quyền Users</a>
            </div>
          </div>
        </li>

        <!-- Collapse Statics manager -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#staticsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
              <i class="fas fa-fw fa-folder"></i>
              <span>Thống kê</span>
            </a>
            <div id="staticsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                  <a class="collapse-item" href="login.html">Kinh phí chương trình</a>
                  <a class="collapse-item" href="login.html">Kinh phí năm học</a>
                  <a class="collapse-item" href="login.html">Tỉ lệ đoàn viên</a>
                  <a class="collapse-item" href="login.html">Tỉ lệ sinh viên</a>
                  <a class="collapse-item" href="login.html">DRL - CTXH</a>
              </div>
            </div>
          </li>

          <!-- Collapse news manager -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#newsManagerCollapse" aria-expanded="true" aria-controls="collapsePages">
              <i class="fas fa-fw fa-folder"></i>
              <span>Quản lý tin tức</span>
            </a>
            <div id="newsManagerCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">Loại tin: </h6>
                  <a class="collapse-item" href="login.html">Danh sách loại tin</a>
                  <a class="collapse-item" href="login.html">Thêm loại tin</a>
                  <h6 class="collapse-header">Bài đăng: </h6>
                  <a class="collapse-item" href="login.html">Danh sách bài đăng</a>
                  <a class="collapse-item" href="login.html">Thêm bài đăng</a>
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
        <hr class="sidebar-divider d-none d-md-block">
        
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
        
      </ul>