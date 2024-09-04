<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String id = request.getParameter("id");
    Connection conn = null;
    PreparedStatement pstmt = null;

    final String DB_URL = "jdbc:mariadb://localhost:3306/ODS_System";
    final String DB_USER = "kyawmgmgthu";
    final String DB_PASSWORD = "kyawmgmgthu789";

    try {
        Class.forName("org.mariadb.jdbc.Driver");

        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        String sql = "DELETE FROM In_Danger WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(id));

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.print("Help deleted successfully.");
            response.sendRedirect("indanger.jsp?message=Help%20deleted%20successfully.");
        } else {
            out.print("Failed to delete help.");
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
