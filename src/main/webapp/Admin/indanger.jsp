<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.List" %>
 <%

final String DB_URL = "jdbc:mariadb://localhost:3306/ODS_System";
final String DB_USER = "kyawmgmgthu";
final String DB_PASSWORD = "kyawmgmgthu789";
%>
<%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ODS | Admin</title>
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
                            <a href="city.jsp" class="side-nav-link">
                                <i class="mdi mdi-city"></i>
                                <span>City</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="contact.jsp" class="side-nav-link">
                                <i class="mdi mdi-home"></i>
                                <span>Department Contacts</span>
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
                                <div class="tab-content mt-4">
                                    <div class="tab-pane show active">
                                        <table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100">
                                         <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Phone Number</th>
                                                    <th>Case</th>
                                                    <th>Map</th>
                                                    <th>Status</th>
                                                    <th>Help Date</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                              <%
                                    Connection conn = null;
                                    Statement stmt = null;
                                    ResultSet rs = null;
                                    int count = 1;

                                    try {
                                        Class.forName("org.mariadb.jdbc.Driver");
                                        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                                        stmt = conn.createStatement();
                                        String sql = "SELECT i.id, i.ph_number, c.case_name, i.map, i.status, i.help_date FROM In_Danger i JOIN `Case` c ON i.case_id = c.id";
                                        rs = stmt.executeQuery(sql);

                                        while (rs.next()) {
                                            int id = rs.getInt("id");
                                            String status = rs.getString("status");
                                            out.println("<tr>");
                                            out.println("<td>" + count + "</td>");
                                            out.println("<td>" + rs.getString("ph_number") + "</td>");
                                            out.println("<td>" + rs.getString("case_name") + "</td>");
                                            out.println("<td><a href='https://www.google.com/maps?q=" + rs.getString("map") + "' target='_blank'>View Map</a></td>");
                                            out.println("<td>");
                                            out.println("<select class='status-select' data-id='" + id + "'>");
                                            out.println("<option value='Pending'" + ("Pending".equals(status) ? " selected" : "") + ">Pending</option>");
                                            out.println("<option value='Accepted'" + ("Accepted".equals(status) ? " selected" : "") + ">Accepted</option>");
                                            out.println("</select>");
                                            out.println("</td>");
                                            out.println("<td>" + rs.getString("help_date") + "</td>");
                                            out.println("<td><a href='deleteIndanger.jsp?id=" + id + "' class='btn btn-danger btn-sm'>Delete</a></td>");
                                            out.println("</tr>");
                                            count++;
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            if (rs != null) rs.close();
                                            if (stmt != null) stmt.close();
                                            if (conn != null) conn.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                %>
                                            </tbody>
                                    </table>                                 
                                    </div> <!-- end preview-->
                                
                                <!-- end row -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

                        
                        <!-- end row -->
                    </div>
                    <!-- container -->

                </div>
                <!-- content -->

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
         <script>
         document.querySelectorAll('.status-select').forEach(select => {
        	    select.addEventListener('change', function() {
        	        const id = this.getAttribute('data-id');
        	        const status = this.value;
        	        
        	        fetch('updateStatus.jsp', {
        	            method: 'POST',
        	            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        	            body: new URLSearchParams({ id: id, status: status })
        	        })
        	        .then(response => response.text())
        	        .then(data => {
        	            if (data.trim() === 'success') {
        	                alert('Status updated successfully.');
        	            } else {
        	                alert('Failed to update status.');
        	            }
        	        })
        	        .catch(error => {
        	            console.error('Error:', error);
        	            alert('Error occurred while updating status.');
        	        });
        	    });
        	});
        
        
        function deleteCity(id) {
            if (confirm('Are you sure you want to delete this help?')) {
                fetch('deleteIndanger.jsp?id=' + id)
                    .then(response => response.text())
                    .then(result => {
                        alert(result);
                        location.reload(); 
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Error occurred while deleting city.');
                    });
            }
        }
    </script>
       
    </body>

</html>
