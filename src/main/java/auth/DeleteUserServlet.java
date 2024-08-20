package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteUserServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userId = request.getParameter("userId");

        if (userId == null || userId.isEmpty()) {
            out.print("Error: No userId provided.");
            return;
        }

        String deleteQuery = "DELETE FROM users WHERE id = ?";

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(userId)); 

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                out.print("Success");
            } else {
                out.print("Failed to delete user.");
            }

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.print("Error: Database driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            out.print("Error: SQL exception occurred.");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.print("Error: Invalid userId format.");
        }
    }
}
