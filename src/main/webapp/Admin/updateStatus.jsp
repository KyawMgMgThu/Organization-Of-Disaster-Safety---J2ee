<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");

    final String DB_URL = "jdbc:mariadb://localhost:3306/ODS_System";
    final String DB_USER = "kyawmgmgthu";
    final String DB_PASSWORD = "kyawmgmgthu789";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String sql = "UPDATE In_Danger SET status = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, status);
        pstmt.setInt(2, Integer.parseInt(id));

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.print("success");
        } else {
            out.print("fail");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("error");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
