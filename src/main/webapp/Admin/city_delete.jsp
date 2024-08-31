<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String id = request.getParameter("id");
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

        // SQL query to delete city data
        String sql = "DELETE FROM City WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(id));

        // Execute the update
        int result = pstmt.executeUpdate();

        // Check the result
        if (result > 0) {
            out.print("City deleted successfully.");
        } else {
            out.print("Failed to delete city.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
