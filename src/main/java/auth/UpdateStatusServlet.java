package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStatusServlet
 */
@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            String sql = "UPDATE In_Danger SET status = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setInt(2, Integer.parseInt(id));

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.getWriter().write("Success");
            } else {
                response.getWriter().write("Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
