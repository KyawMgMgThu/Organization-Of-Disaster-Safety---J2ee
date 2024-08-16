<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ODS | Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include CSS files -->
    <link href="assets/css/vendor/dataTables.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/responsive.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/buttons.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/select.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/fixedHeader.bootstrap5.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/vendor/fixedColumns.bootstrap5.css" rel="stylesheet" type="text/css" />
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
                        <a href="index.html" class="side-nav-link">
                            <i class="uil-home-alt"></i>
                            <span> Dashboards</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="news.html" class="side-nav-link">
                            <i class="mdi mdi-newspaper"></i>
                            <span> News</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a href="indanger.html" class="side-nav-link">
                            <i class="mdi mdi-car-emergency"></i>
                            <span>In Danger</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a
                            href="map.html"
                            class="side-nav-link"
                        >
                            <i class="uil-location-point"></i>
                            <span> Maps</span>
                        </a>
                    </li>
                    <li class="side-nav-item">
                        <a
                            href="admin.html"
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
                                <span class="account-user-name mt-2">Kyaw Mg Mg Thu</span>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="tab-content mt-4">
                            <div class="tab-pane show active">
                                <table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Start Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection conn = null;
                                            Statement stmt = null;
                                            ResultSet rs = null;
                                            try {
                                            	Class.forName("org.mariadb.jdbc.Driver");
                                                conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");
                                                stmt = conn.createStatement();
                                                String query = "SELECT * FROM users";
                                                rs = stmt.executeQuery(query);
                                                int count = 1;
                                                while (rs.next()) {
                                                    out.println("<tr>");
                                                    out.println("<td>" + count + "</td>");
                                                    out.println("<td>" + rs.getString("name") + "</td>");
                                                    out.println("<td>" + rs.getString("email") + "</td>");
                                                    out.println("<td>" + rs.getDate("start_date") + "</td>");
                                                    out.println("<td>");
                                                    out.println("<button class='btn btn-primary btn-sm edit-btn' onclick='editUser(" + rs.getInt("id") + ")'>");
                                                    out.println("<i class='mdi mdi-pencil'></i> Edit");
                                                    out.println("</button>");
                                                    out.println("<button class='btn btn-danger btn-sm delete-btn' onclick='deleteUser(" + rs.getInt("id") + ")'>");
                                                    out.println("<i class='mdi mdi-trash-can'></i> Delete");
                                                    out.println("</button>");
                                                    out.println("</td>");
                                                    out.println("</tr>");
                                                    count++;
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Edit Form Modal -->
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="editModalLabel">Edit User</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" method="post" action="EditUserServlet">
                        <input type="hidden" id="userId" name="userId">
                        <div class="mb-3">
                            <label for="editName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="editName" name="name">
                        </div>
                        <div class="mb-3">
                            <label for="editEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="editEmail" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="editPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="editPassword" name="password">
                        </div>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <script>document.write(new Date().getFullYear())</script>
                    © All Rights Reserved. Developed by Group✌🏽+☝🏽
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

    <!-- Include JS files -->
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
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
    <script src="assets/js/pages/demo.datatable-init.js"></script>
    <script src="assets/js/script.js"></script>
    <script>
        function editUser(id) {
            fetch(`GetUserServlet?id=${id}`)
                .then(response => response.json())
                .then(user => {
                    document.getElementById('userId').value = user.id;
                    document.getElementById('editName').value = user.name;
                    document.getElementById('editEmail').value = user.email;
                    $('#editModal').modal('show');
                });
        }

        function deleteUser(id) {
            if (confirm('Are you sure you want to delete this user?')) {
                fetch(`DeleteUserServlet?id=${id}`, { method: 'DELETE' })
                    .then(() => location.reload());
            }
        }
    </script>
</body>
</html>
