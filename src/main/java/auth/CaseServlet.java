package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CaseServlet")
public class CaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // doGet method
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String caseName = request.getParameter("name");

        if (caseName == null || caseName.trim().isEmpty()) {
            response.getWriter().println("Case name is missing or empty.");
            return; // Exit the method if the case name is not provided
        }

        String jdbcURL = "jdbc:mariadb://localhost:3306/ODS_System";
        String dbUser = "kyawmgmgthu";
        String dbPassword = "kyawmgmgthu789";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "INSERT INTO `Case` (case_name) VALUES (?)";

            statement = connection.prepareStatement(sql);
            statement.setString(1, caseName);

            int rows = statement.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("/Disaster_Safety/Admin/case.jsp");
            } else {
                response.getWriter().println("Failed to insert the case.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database connection or query failed: " + e.getMessage());
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // doPost method
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
