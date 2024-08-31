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

    String sql = "DELETE FROM department_contacts WHERE id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(id));

    int result = pstmt.executeUpdate();

    if (result > 0) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("Failed");
} finally {
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>
