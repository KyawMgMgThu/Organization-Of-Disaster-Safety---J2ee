package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import auth.util.DatabaseConnection;

/**
 * Servlet implementation class GetUserLocationServlet
 */
@WebServlet("/GetUserLocationServlet")
public class GetUserLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"); // Assume you pass user ID as a parameter
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<String> locations = new ArrayList<>();
        
        try {
            // Load MariaDB JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Optionally, set an error message attribute and forward to an error page
            request.setAttribute("errorMessage", "Database driver not found: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // SQL query to retrieve the 'map' location based on 'user_id'
            String query = "SELECT map FROM In_Danger WHERE user_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, userId);
            rs = stmt.executeQuery();

            // Collecting all locations into a list
            while (rs.next()) {
                locations.add(rs.getString("map"));
            }

            // Setting locations as a request attribute
            request.setAttribute("locations", locations);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/map.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, set an error message attribute and forward to an error page
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/error.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
