<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ODS | News</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/element.css" rel="stylesheet">
    <link rel="stylesheet" href="../font awesome/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Caveat+Brush" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" crossorigin=""></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .fh5co-blog {
            background-color: black;
            border-radius: 1rem;
            padding: 1rem;
            margin-bottom: 1rem;
        }
        .content-preview, .content-short {
            font-size: 1.8rem;
            color: #00fff4;
        }
        .content-short {
            display: none;
        }
        .read-more-btn {
            cursor: pointer;
            color: #007bff;
            text-decoration: underline;
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
                        Organization Of</br>
                        <span class="well_1">Disaster Safety</span>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-center">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="inDanger.jsp">In Danger?</a></li>
                        <li class="active"><a href="news.jsp">News</a></li>
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
                                            <form class="navbar-form navbar-left" role="search" method="GET" action="news.jsp">
                                                <div class="input-group">
                                                    <input type="text" name="query" class="form-control" placeholder="Search">
                                                    <span class="input-group-btn">
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

    <div class="container" style="margin: 10rem 0rem;">
        <div class="row">
            <%
                String url = "jdbc:mariadb://localhost:3306/ODS_System";
                String username = "kyawmgmgthu";
                String password = "kyawmgmgthu789";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                String query = "SELECT * FROM news";
                String searchQuery = request.getParameter("query");

                if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                    query += " WHERE title LIKE ? OR content LIKE ?";
                }

                try {
                    Class.forName("org.mariadb.jdbc.Driver");
                    conn = DriverManager.getConnection(url, username, password);
                    pstmt = conn.prepareStatement(query);

                    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                        String searchParam = "%" + searchQuery + "%";
                        pstmt.setString(1, searchParam);
                        pstmt.setString(2, searchParam);
                    }

                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("title");
                        String content = rs.getString("content");
                        String photoPath = rs.getString("photo_path");
                        String createdAt = rs.getString("created_at");
                        String contentPreview = content.length() > 100 ? content.substring(0, 100) + "..." : content;
            %>
            <div class="col-lg-4 col-md-4">
                <div class="fh5co-blog animate-box">
                    <a href="#"><img class="img-responsive" src="../news_image/<%= photoPath %>" alt="<%= title %>"></a>
                    <div class="image-popup" href="#">
                        <div class="prod-title">
                            <h3><a href="newsdetails.jsp?id=<%= id %>"><%= title %></a></h3>
                            <span class="posted_by">Posted on: <b><%= createdAt %></b></span>
                            <p class="content-short"><%= content %></p>
                            <p class="content-preview"><%= contentPreview %></p>
                            <span class="read-more-btn" onclick="window.location.href='newsdetails.jsp?id=<%= id %>'">Read More</span>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
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
