<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="auth.model.InDanger" %>

<%
    List<InDanger> inDangerList = (List<InDanger>) session.getAttribute("inDangerList");
    if (inDangerList == null) {
        inDangerList = new ArrayList<>();
    }

    int inDangerCount = 0;
    int newsCount = 0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

        // Count for In_Danger
        String inDangerQuery = "SELECT COUNT(*) FROM In_Danger";
        stmt = conn.prepareStatement(inDangerQuery);
        rs = stmt.executeQuery();
        if (rs.next()) {
            inDangerCount = rs.getInt(1);
        }

        // Count for News
        String newsQuery = "SELECT COUNT(*) FROM news";
        stmt = conn.prepareStatement(newsQuery);
        rs = stmt.executeQuery();
        if (rs.next()) {
            newsCount = rs.getInt(1);
        }

        // Set counts as request attributes
        request.setAttribute("inDangerCount", inDangerCount);
        request.setAttribute("newsCount", newsCount);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ODS | Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- third party css -->
        <link href="assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">
        <!-- App css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css">
        <link
            href="assets/css/app.min.css"
            rel="stylesheet"
            type="text/css"
            id="app-style"
        >
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
                            <a href="case.jsp" class="side-nav-link">
                                <i class="mdi mdi-heart-pulse"></i>
                                <span>Case</span>
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
                                <i class="mdi mdi-map-marker-radius"></i>
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
                                        <a href="/Disaster_Safety/LogoutServlet">Logout</a>
                                    </li>
                                    <li>
                                        <a href="recover.jsp">Recover Password</a>
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
                                <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                                    <form class="p-3">
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Search ..."
                                            aria-label="Recipient's username"
                                        >
                                    </form>
                                </div>
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
                                    <!-- item-->
                                    <a href="/Disaster_Safety/LogoutServlet" class="dropdown-item notify-item">
                                        <i class="mdi mdi-logout me-1"></i>
                                        <span>Logout</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                        <button class="button-menu-mobile open-left">
                            <i class="mdi mdi-menu"></i>
                        </button>
                    </div>
                    <!-- end Topbar -->
                    <!-- Start Content-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class=" col-xl-12 col-lg-12">
                                <div class="row mt-4">
                                    <div class="col-sm-6">
                                        <div class="card widget-flat">
                                            <div class="card-body">
                                                <div class="float-end">
                                                    <i class="mdi mdi-newspaper"></i>
                                                </div>
                                                <h5 class="text-muted fw-normal mt-0" title="Number of News">Total News</h5>
                                                  <h3 class="mt-3 mb-3"><%= request.getAttribute("newsCount") %></h3>
                                            </div>
                                            <!-- end card-body-->
                                        </div>
                                        <!-- end card-->
                                    </div>
                                    <!-- end col-->
                                    <div class="col-sm-6">
                                        <div class="card widget-flat">
                                            <div class="card-body">
                                                <div class="float-end">
                                                    <i class="mdi mdi-medical-bag"></i>
                                                </div>
                                                <h5 class="text-muted fw-normal mt-0" title="Number of Dengerous">To People Asking For Help </h5>
                                                <h3 class="mt-3 mb-3"><%= request.getAttribute("inDangerCount") %></h3>
                                            </div>
                                            <!-- end card-body-->
                                        </div>
                                        <!-- end card-->
                                    </div>
                                    <!-- end col-->
                                </div>
                                <!-- end row -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-xl-12 col-lg-12 order-lg-2 order-xl-1">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <h4 class="header-title">List of people asking for help</h4>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped dt-responsive nowrap w-100">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Phone Number</th>
                                                        <th>Case</th>
                                                        <th>Location (Map)</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                      <% for (InDanger inDanger : inDangerList) { %>
                                        <tr>
                                            <td><%= inDanger.getId() %></td>
                                            <td><%= inDanger.getPhoneNumber() %></td>
                                            <td><%= inDanger.getCaseType() %></td>
                                            <td><a href="map.html?q=<%= inDanger.getLocation() %>" target="_blank">View Map</a></td>
                                            <td>
                                                <!-- Placeholder for Accept/Delete actions -->
                                                <form action="/Disaster_Safety/DeleteInDangerServlet" method="post">
                                                    <input type="hidden" name="id" value="<%= inDanger.getId() %>">
                                                    <button type="submit" name="action" value="delete" class="btn btn-danger">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% } %>
                                                </tbody>
                                                
                                                
                                                
                                            </table>                  
                                        </div>
                                        <!-- end table-responsive-->
                                    </div>
                                    <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- container -->
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
        <!-- bundle -->
        <script src="assets/js/vendor.min.js"></script>
        <script src="assets/js/app.min.js"></script>
        <!-- third party js -->
        <script src="assets/js/vendor/apexcharts.min.js"></script>
        <script src="assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
        <!-- third party js ends -->
        <!-- demo app -->
        <script src="assets/js/pages/demo.dashboard.js"></script>
        <!-- end demo js-->
    </body>

</html>
