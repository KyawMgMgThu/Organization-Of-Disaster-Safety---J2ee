package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import auth.util.DatabaseConnection;

@WebServlet("/DeleteInDangerServlet")
public class DeleteInDangerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        if (id != null && !id.isEmpty()) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "DELETE FROM In_Danger WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(id));
                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("/Disaster_Safety/Indanger?status=success");
                    } else {
                        response.sendRedirect("/Disaster_Safety/Indanger?status=notfound");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("/Disaster_Safety/Indanger?status=error");
            }
        } else {
            response.sendRedirect("/Disaster_Safety/Indanger?status=invalid");
        }
    }
}
