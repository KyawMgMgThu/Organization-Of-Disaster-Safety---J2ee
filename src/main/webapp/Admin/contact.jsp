<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%

String city_id = request.getParameter("city_id");
String d_name = request.getParameter("d_name");
String phone_number = request.getParameter("phone_number");
Connection conn = null;
PreparedStatement pstmt = null;

final String DB_URL = "jdbc:mariadb://localhost:3306/ODS_System";
final String DB_USER = "kyawmgmgthu";
final String DB_PASSWORD = "kyawmgmgthu789";

try {
    // Load the MariaDB JDBC driver
    Class.forName("org.mariadb.jdbc.Driver");

    // Establish database connection
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    // SQL query to insert city data
    String sql = "INSERT INTO department_contacts (city_id, department_name, phone_number) VALUES (?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, city_id);
    pstmt.setString(2, d_name);
    pstmt.setString(3, phone_number);


        // Execute the update
        int result = pstmt.executeUpdate();

        // Check the result
        if (result > 0) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ODS | City</title>
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                    <div class="text-end my-2">
                                         <button class="btn btn-secondary" onclick="openAddCityModal()"><i class="mdi mdi-plus"></i> Add</button>           
                                </div>
                        <div class="tab-content mt-4">
                            <div class="tab-pane show active">
                                <table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>City Id</th>
                                            <th>Location</th>
                                        <th>Phone Number</th>

                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                      Statement stmt = null;
                                      ResultSet rs = null;

                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                        stmt = conn.createStatement();
                        String query = "SELECT * FROM department_contacts";
                        rs = stmt.executeQuery(query);
                        int count = 1;

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + count + "</td>");
                            out.println("<td>" + rs.getString("city_id") + "</td>");
                            out.println("<td>" +rs.getString("department_name") +"</td>");
                            out.println("<td>" +rs.getString("phone_number") +"</td>");
                            out.println("<td>");
                            out.println("<button class='btn btn-danger btn-sm delete-btn' onclick='deleteContact(" + rs.getInt("id") + ")'>");
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


 <!-- Modal box -->
       <div id="addCityModal" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); width:300px; background:#fff; padding:20px; border-radius:8px; box-shadow:0 0 15px rgba(0,0,0,0.1); z-index:1000;">
        <h4>Add City</h4>
        <form id="addCityForm" onsubmit="return saveCity()">
            <div class="mb-3">
                <label for="DPname" class="form-label">Department Name</label>
                <input type="text" class="form-control" id="DPname" name="d_name" required>
            </div>
            <div class="mb-3">
                <label for="phNo" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phNo" name="phone_number" required>
            </div>
            <div class="mb-3">
    <label for="city-select">Select City:</label>
    <select id="city-select" class="form-control" onchange="showCityData()">
        <option value="" name="city_id">Select a City</option>
        <% 
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                stmt = conn.createStatement();
                String query = "SELECT id,name FROM City";
                rs = stmt.executeQuery(query);
                while (rs.next()) {
                    out.println("<option value='" + rs.getString("id") + "'>" + rs.getString("name") + "</option>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </select>
</div>
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="button" class="btn btn-secondary" onclick="closeAddCityModal()">Cancel</button>
        </form>
    </div>

    <!-- Overlay -->
    <div id="modalOverlay" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:999;"></div>



   
    
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
   
   
   function openAddCityModal() {
       document.getElementById('addCityModal').style.display = 'block';
       document.getElementById('modalOverlay').style.display = 'block';
   }

   function closeAddCityModal() {
       document.getElementById('addCityModal').style.display = 'none';
       document.getElementById('modalOverlay').style.display = 'none';
   }
   $('#addCityForm').on('submit', function (e) {
	    e.preventDefault();
	    var cityId = $('#city-select').val();
	    var departmentName = $('#DPname').val();
	    var phoneNumber = $('#phNo').val();

	    $.ajax({
	        url: 'contact_add.jsp',
	        type: 'POST',
	        data: {
	            city_id: cityId,
	            d_name: departmentName,
	            phone_number: phoneNumber
	        },
	        success: function (response) {
	            if (response.trim() === 'Success') {
	                alert('City added successfully');
	                closeAddCityModal();
	                location.reload(); // Refresh the page to show the new data
	            } else {
	                alert('Failed to add city');
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error('Error:', error);
	            alert('An error occurred while adding the city.');
	        }
	    });
	});

   function deleteContact(id) {
	    if (confirm('Are you sure you want to delete this contact?')) {
	        $.ajax({
	            url: 'contact_delete.jsp',
	            type: 'GET',
	            data: {
	                id: id
	            },
	            success: function (response) {
	                if (response.trim() === 'Success') {
	                    alert('Contact deleted successfully');
	                    location.reload(); // Refresh the page to remove the deleted row
	                } else {contact_delete
	                    alert('Failed to delete contact');
	                }
	            },
	            error: function (xhr, status, error) {
	                console.error('Error:', error);
	                alert('An error occurred while deleting the contact.');
	            }
	        });
	    }
	}
 

</script>

</body>
</html>
