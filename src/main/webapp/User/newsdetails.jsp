<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ODS | News Details</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/element.css" rel="stylesheet">
    <link rel="stylesheet" href="../font awesome/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        .news-detail {
            margin: 5rem auto;
            padding: 2rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
         }
         
        .news-detail img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 1rem;
        }
        .news-detail h1 {
            margin-top: 0;
            margin-bottom: 1rem;
            color: #333;
        }
        .news-detail p {
            color: #555;
            font-size: 2rem;
            line-height: 1.6;
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
                        <li><a href="../Admin/index.jsp">Admin</a></li>
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

    <div class="container" style="margin-top: 5rem;">
        <div class="news-detail">
            <%
                String url = "jdbc:mariadb://localhost:3306/ODS_System";
                String username = "kyawmgmgthu";
                String password = "kyawmgmgthu789";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                String idParam = request.getParameter("id");
                if (idParam != null) {
                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        conn = DriverManager.getConnection(url, username, password);
                        String query = "SELECT * FROM news WHERE id = ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, Integer.parseInt(idParam));
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            String title = rs.getString("title");
                            String content = rs.getString("content");
                            String photoPath = rs.getString("photo_path");
                            String createdAt = rs.getString("created_at");
            %>
            <h1><b><%= title %></b></h1>
            <img src="../news_image/<%= photoPath %>" alt="<%= title %>">
            <p><%= content %></p>
            <a href="news.jsp" class="btn btn-primary">Back</a>
            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            %>
        </div>
    </div>
    
    <section id="footer">
        <div class="col-sm-12 padding_all">
            <div class="footer_inner clearfix">
                <div class="col-sm-10">
                    <div class="footer_8">
                        <p>© All Rights Reserved. Developed by <a href="https://www.github.com/kyawmgmgthu">Group✌🏽+☝🏽</a></p>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </section>
  
    <script src="js/script.js"></script>
    <script type="text/javascript">
    const year = new Date().getFullYear();
    document.getElementById('year').textContent = year;
    </script>
</body>
</html>
