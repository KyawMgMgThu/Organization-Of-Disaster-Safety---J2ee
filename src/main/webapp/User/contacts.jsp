<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ODS | Contacts</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/element.css" rel="stylesheet">
    <link rel="stylesheet" href="../font awesome/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Caveat+Brush" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .card{
            background-color: black;
            border-radius: 1rem;
            padding: 1rem;
            color: #00fff4;
        }
        .fas{
            margin-right: 1rem;
        }
        .card .card-body h5, p{
            font-size: 1.8rem;
        }
    </style>
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
            <a class="navbar-brand" href="index.jsp">
              Organization Of
              <br />
              <span class="well_1">Disaster Safety</span>
            </a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-center">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="inDanger.jsp">In Danger?</a></li>
              <li><a href="news.jsp">News</a></li>
              <li class="active"><a href="contacts.jsp">Contacts</a></li>
              <li><a href="weather.html">Weather</a></li>
            </ul>
            <ul class="navbar-right">
              <li class="dropdown">
                <a class="text_1 pad_1" href="#" data-toggle="dropdown">
                  <span class="fas fa-search"></span>
                </a>
                <ul class="dropdown-menu drop_inner" style="min-width:100%;">
                  <li>
                    <div class="row_1">
                      <div class="col-sm-12">
                        <form class="navbar-form navbar-left" role="search" method="GET" action="contacts.jsp">
                          <div class="input-group">
                            <!-- Added 'name' attribute -->
                            <input type="text" class="form-control" placeholder="Search" name="query">
                            <span class="input-group-btn">
                              <!-- Changed button type to 'submit' -->
                              <button class="btn btn-primary" type="submit">Go!</button>
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

    <div class="container" style="margin-top: 100px;">
      <div class="row">
        <%
          // Database connection details
          String url = "jdbc:mariadb://localhost:3306/ODS_System";
          String username = "kyawmgmgthu";
          String password = "kyawmgmgthu789";
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;

          // Base query to fetch all contacts
          String query = "SELECT * FROM department_contacts dc JOIN City c ON dc.city_id = c.id";
          String searchQuery = request.getParameter("query");

          // If a search query is provided, modify the query to filter results
          if (searchQuery != null && !searchQuery.trim().isEmpty()) {
              query += " WHERE dc.department_name LIKE ? OR dc.phone_number LIKE ? OR c.city_name LIKE ?";
          }

          try {
              Class.forName("org.mariadb.jdbc.Driver");
              conn = DriverManager.getConnection(url, username, password);
              pstmt = conn.prepareStatement(query);

              // If a search query is provided, set the search parameter in the prepared statement
              if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                  String searchParam = "%" + searchQuery + "%";
                  pstmt.setString(1, searchParam);
                  pstmt.setString(2, searchParam);
                  pstmt.setString(3, searchParam);
              }

              rs = pstmt.executeQuery();

              // Loop through the results and display each contact
              while (rs.next()) {
                  int id = rs.getInt("id");
                  String city = rs.getString("name");  // Fetching city name instead of city_id
                  String d_name = rs.getString("department_name");
                  String phNo = rs.getString("phone_number");
        %>
        <div class="col-md-4">
          <div class="card" style="margin-bottom: 20px;">
            <div class="card-body">
              <h5 class="card-title"><i class="fas fa-home"></i><%= d_name %></h5>
              <h5 class="card-title"><i class="fas fa-map-marker-alt"></i> Location: <%= city %></h5>
              <p class="card-text"><i class="fas fa-phone-alt"></i> Phone: <%= phNo %></p>
            </div>
          </div>
        </div>
        <%
              }  // End of while loop
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
              if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
              if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
          }
        %>
      </div>
    </div>

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

    <script src="js/script.js"></script>
    <script>  const year = new Date().getFullYear();
    document.getElementById('year').textContent = year;</script>
  </body>
</html>
