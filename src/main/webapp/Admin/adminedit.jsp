<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ODS | Admin Edit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- third party css -->
    <link href="assets/css/vendor/dataTables.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/responsive.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/buttons.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/select.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/fixedHeader.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/fixedColumns.bootstrap5.css" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

    <!-- App css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style"/>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body
    class="loading"
    data-layout-color="light"
    data-leftbar-theme="dark"
    data-layout-mode="fluid"
    data-rightbar-onstart="true"
>
 		  <!-- Begin page -->
    <div class="wrapper">
        <!-- ========== Left Sidebar Start ========== -->
        <div class="leftside-menu">
            <!-- LOGO -->
            <a href="index.html" class="logo text-center logo-light">

            </a>
            <div class="h-100" id="leftside-menu-container" data-simplebar>
                <!--- Sidemenu -->
                <ul class="side-nav">
                    <li class="side-nav-title side-nav-item">Navigation</li>
                    <li class="side-nav-item">
                        <a href="index.jsp" class="side-nav-link">
                            <i class="uil-home-alt"></i>
                            <span> Dashboards</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="news.jsp" class="side-nav-link">
                            <i class="mdi mdi-newspaper"></i>
                            <span> News</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="indanger.jsp" class="side-nav-link">
                            <i class="mdi mdi-car-emergency"></i>
                            <span>In Danger</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a
                            href="map.jsp"
                            class="side-nav-link"
                        >
                            <i class="uil-location-point"></i>
                            <span> Maps</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a
                            href="admin.jsp"
                            class="side-nav-link"
                        >
                            <i class="uil-user"></i>
                            <span>Admin</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a
                            data-bs-toggle="collapse"
                            href="#sidebarPagesAuth"
                            aria-expanded="false"
                            aria-controls="sidebarPagesAuth"
                            class="side-nav-link"
                        >
                            <i class="uil-copy-alt"></i>
                            <span> Authentication</span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarPagesAuth">
                            <ul class="side-nav-third-level">
                                <li>
                                    <a href="login.jsp">Login</a>
                                </li>
                                <li>
                                    <a href="register.jsp">Register</a>
                                </li>
                                <li>
                                    <a href="logout.jsp">Logout</a>
                                </li>
                                <li>
                                    <a href="recoverpw.jsp">Recover Password</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    
                </ul>
                <!-- End Sidebar -->
                <div class="clearfix"></div>
            </div>
            <!-- Sidebar -left -->
        </div>
  
        
        <div class="content-page">
            <div class="content">
                <!-- Topbar Start -->
                <div class="navbar-custom">
                <ul class="list-unstyled topbar-menu float-end mb-0">
                    <li class="dropdown notification-list d-lg-none">
                        <a
                            class="nav-link dropdown-toggle arrow-none"
                            data-bs-toggle="dropdown"
                            href="#"
                            role="button"
                            aria-haspopup="false"
                            aria-expanded="false"
                        >
                            <i class="dripicons-search noti-icon"></i>
                    </a>
                    </li>
                    <li class="dropdown notification-list">
                        <a
                            class="nav-link dropdown-toggle arrow-none"
                            data-bs-toggle="dropdown"
                            href="#"
                            role="button"
                            aria-haspopup="false"
                            aria-expanded="false"
                        >
                            <i class="dripicons-bell noti-icon"></i>
                            <span class="noti-icon-badge"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg">
                            <!-- item-->
                            <div class="dropdown-item noti-title px-3">
                                <h5 class="m-0">
                                    <span class="float-end">
                                        <a href="javascript: void(0);" class="text-dark">
                                            <small>Clear All</small>
                                        </a>
                                    </span>
                                    Notification
                                </h5>
                            </div>
                        </div>
                    </li>
                    <li class="notification-list">
                        <a class="nav-link end-bar-toggle" href="javascript: void(0);">
                            <i class="dripicons-gear noti-icon"></i>
                        </a>
                    </li>
                    <li class="dropdown notification-list">
                        <a
                            class="nav-link dropdown-toggle nav-user arrow-none me-0"
                            data-bs-toggle="dropdown"
                            href="#"
                            role="button"
                            aria-haspopup="false"
                            aria-expanded="false"
                        >
                        <span class="account-user-avatar">
                            <i class="uil-user icon-size-lg rounded-circle"></i>
                        </span>
                            <span>
                                <span class="account-user-name mt-2"><%
   									 if (session != null && session.getAttribute("username") != null) {
        									out.print(session.getAttribute("username"));
    								} else {
        									response.sendRedirect("login.jsp");
        									return; 
    									}
									%></span>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                           <form action="/Disaster_Safety/LogoutServlet" method="get">
    <button type="submit" class="dropdown-item notify-item">
        <i class="mdi mdi-logout me-1"></i>
        <span>Logout</span>
    </button>
</form>

                        </div>
                    </li>
                </ul>
                <button class="button-menu-mobile open-left">
                    <i class="mdi mdi-menu"></i>
                </button>
             
            </div>
                <!-- Topbar content here -->
                <!-- end Topbar -->
                <!-- Start Content-->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12 col-lg-6 mt-3">
                            <div class="card">
                                <div class="card-body p-4">
                                    <div class="text-center w-75 m-auto">
                                        <h4 class="text-dark-50 text-center mt-0 fw-bold">Admin Account Edit</h4>
                                        <p class="text-muted mb-4">Edit your account</p>
                                    </div>
                   <%
                                        Connection conn = null;
                                        PreparedStatement pstmt = null;
                                        ResultSet rs = null;
                                        String userId = request.getParameter("id");

                                        if (userId == null || userId.isEmpty()) {
                                            out.println("User ID is missing.");
                                            return;
                                        }

                                        try {
                                            Class.forName("org.mariadb.jdbc.Driver");
                                            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");
                                            String query = "SELECT * FROM users WHERE id = ?";
                                            pstmt = conn.prepareStatement(query);
                                            pstmt.setInt(1, Integer.parseInt(userId));
                                            rs = pstmt.executeQuery();

                                            if (rs.next()) {
                                                String name = rs.getString("name");
                                                String email = rs.getString("email");
                                                String startDate = rs.getString("start_date"); // Make sure to handle date format properly
                                    %>
                                    <form action="/Disaster_Safety/adminedit" method="post">
                                        <input type="hidden" name="id" value="<%= userId %>">
                                        <div class="mb-3">
                                            <label for="editName" class="form-label">Name</label>
                                            <input type="text" id="editName" name="name" class="form-control" value="<%= name %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="editEmail" class="form-label">Email</label>
                                            <input type="email" id="editEmail" name="email" class="form-control" value="<%= email %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="editStartDate" class="form-label">Start Date</label>
                                            <input type="date" id="editStartDate" name="start_date" class="form-control" value="<%= startDate %>">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </form>
                                    <%
                                            } else {
                                                out.println("User not found.");
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                        }
                                    %>
                                </div> <!-- end card-body -->
                            </div> <!-- end card -->
                          
                        </div> <!-- end col -->
                    </div>
                </div>
                <!-- content -->
                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <script>document.write(new Date().getFullYear())</script>
                                © All Rights Reserved. Developed by Group ✌🏽+☝🏽 
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end footer-links d-none d-md-block">
                                    <a href="about.html">About</a>
                                    <a href="contact.html">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
        </div>
        <!-- END wrapper -->
       <!-- Right Sidebar -->
        <div class="end-bar">
            <div class="rightbar-title">
                <a href="javascript:void(0);" class="end-bar-toggle float-end">
                    <i class="dripicons-cross noti-icon"></i>
                </a>
                <h5 class="m-0">Settings</h5>
            </div>
            <div class="rightbar-content h-100" data-simplebar>
                <div class="p-3">
                    <!-- Settings -->
                    <h5 class="mt-3">Color Scheme</h5>
                    <hr class="mt-1">
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="color-scheme-mode"
                            value="light"
                            id="light-mode-check"
                            checked
                        >
                        <label class="form-check-label" for="light-mode-check">Light Mode</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="color-scheme-mode"
                            value="dark"
                            id="dark-mode-check"
                        >
                        <label class="form-check-label" for="dark-mode-check">Dark Mode</label>
                    </div>
                    <!-- Width -->
                    <h5 class="mt-4">Width</h5>
                    <hr class="mt-1">
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="width"
                            value="fluid"
                            id="fluid-check"
                            checked
                        >
                        <label class="form-check-label" for="fluid-check">Fluid</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="width"
                            value="boxed"
                            id="boxed-check"
                        >
                        <label class="form-check-label" for="boxed-check">Boxed</label>
                    </div>
                    <!-- Left Sidebar-->
                    <h5 class="mt-4">Left Sidebar</h5>
                    <hr class="mt-1">
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="theme"
                            value="default"
                            id="default-check"
                        >
                        <label class="form-check-label" for="default-check">Default</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="theme"
                            value="light"
                            id="light-check"
                            checked
                        >
                        <label class="form-check-label" for="light-check">Light</label>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="theme"
                            value="dark"
                            id="dark-check"
                        >
                        <label class="form-check-label" for="dark-check">Dark</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="compact"
                            value="fixed"
                            id="fixed-check"
                            checked
                        >
                        <label class="form-check-label" for="fixed-check">Fixed</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="compact"
                            value="condensed"
                            id="condensed-check"
                        >
                        <label class="form-check-label" for="condensed-check">Condensed</label>
                    </div>
                    <div class="form-check form-switch mb-1">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            name="compact"
                            value="scrollable"
                            id="scrollable-check"
                        >
                        <label class="form-check-label" for="scrollable-check">Scrollable</label>
                    </div>

                </div>
                <!-- end padding-->
            </div>
        </div>
        <div class="rightbar-overlay"></div>
        <!-- /End-bar -->
        <!-- /End-bar -->
        <script src="assets/js/vendor.min.js"></script>
        <script src="assets/js/app.min.js"></script>

        <!-- third party js -->
        <script src="assets/js/vendor/jquery.dataTables.min.js"></script>
        <script src="assets/js/vendor/dataTables.bootstrap5.js"></script>
        <script src="assets/js/vendor/dataTables.responsive.min.js"></script>
        <script src="assets/js/vendor/responsive.bootstrap5.min.js"></script>
        <script src="assets/js/vendor/dataTables.buttons.min.js"></script>
        <script src="assets/js/vendor/buttons.bootstrap5.min.js"></script>
        <script src="assets/js/vendor/buttons.print.min.js"></script>
        <script src="assets/js/vendor/dataTables.keyTable.min.js"></script>
        <script src="assets/js/vendor/fixedColumns.bootstrap5.min.js"></script>
        <script src="assets/js/vendor/fixedHeader.bootstrap5.min.js"></script>
        <!-- third party js ends -->

        <!-- demo app -->
        <script src="assets/js/pages/demo.datatable-init.js"></script>
        <script src="assets/js/script.js"></script>

    </body>
</html>
