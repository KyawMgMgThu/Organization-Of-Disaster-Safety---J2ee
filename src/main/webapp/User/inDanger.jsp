<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mariadb://localhost:3306/ODS_System";
    String user = "kyawmgmgthu";
    String password = "kyawmgmgthu789"; 

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT id, case_name FROM `Case`"); // Using backticks for reserved keyword

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OBS | In Danger?</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/element.css" rel="stylesheet">
        <link rel="stylesheet" href="../font awesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Caveat+Brush" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="">
        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <section id="header">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">Organization Of
                            <br>
                            <span class="well_1">Disaster Safety</span>
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-center">
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="inDanger.jsp">In Danger?</a></li>
                            <li>
                                <a href="news.jsp">News</a>
                            </li>
                            <li><a href="contacts.jsp">Contacts</a></li>
                            <li><a href="weather.html">Weather</a></li>
                        </ul>
                        <ul class="navbar-right">
                            <li class="dropdown">
                                <a class="text_1 pad_1" href="#" data-toggle="dropdown"><span class="fas fa-search"></span></a>
                                <ul class="dropdown-menu drop_inner" style="min-width:100%;">
                                    <li>
                                        <div class="row_1">
                                            <div class="col-sm-12">
                                                <form class="navbar-form navbar-left" role="search">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Search">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-primary" type="button">Go!</button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        <section class="form">
            <div class="container">
                <h1 class="my-4">User Location Form</h1>
                <form action="/Disaster_Safety/InDangerServlet" method="post" id="userForm">
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="tel" class="form-control my-2" id="phone" name="phone" placeholder="Enter your phone number" required>
                    </div>
                    <div class="form-group">
                        <label for="case">Choose Case:</label>
                        <select class="form-control form-select" id="case" name="case" required>
                            <option selected disabled>Select a Case</option>
                            <% while(rs.next()) { %>
                                <option value="<%= rs.getInt("id") %>">
                                    <%= rs.getString("case_name") %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <input class="btn btn-primary" type="submit" style="margin-top: 1rem;" value="Submit">
                </form>
                <div id="map" class="my-4"></div>
            </div>
        </section>
        <section id="footer">
            <div class="col-sm-12 padding_all">
                <div class="footer_inner clearfix">
                    <div class="col-sm-10">
                        <div class="footer_8">
                            <p><b id="year"></b>&#169 All Rights Reserved. Developed by
                                <a href="#">Group III</a>
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
</section>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script src="js/map.js"></script>
        <script>
        const year = new Date().getFullYear();
        document.getElementById('year').textContent = year;
        document.getElementById('userForm').addEventListener('submit', function(event) {
            event.preventDefault(); 
            console.log('Form submitted');
            const phone = document.getElementById('phone').value;
            const caseId = document.getElementById('case').value;

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        const lat = position.coords.latitude;
                        const lng = position.coords.longitude;
                        updateMap(lat, lng);
                        sendLocation(phone, caseId, lat, lng);
                    },
                    function(error) {
                        console.error("Geolocation error:", error);
                    },
                    { enableHighAccuracy: true }
                );
            } else {
					console.log("error");
            }
        });

        function sendLocation(phone, caseId, lat, lng) {
            console.log('Sending data:', { phone: phone, case: caseId, latitude: lat, longitude: lng });
            fetch('/Disaster_Safety/InDangerServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ phone: phone, case: caseId, latitude: lat, longitude: lng })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Response:', data);
                if (data.status === "success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: 'Your location has been successfully submitted.',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        window.location.href = "index.jsp";  // Example redirection after success
                    });
                } else {
                 
                }
            })
            .catch(error => {
                console.error('Error:', error);
              
            });
        }

       
        </script>
    </body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
