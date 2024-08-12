package coder;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/user_db";
    private static final String JDBC_USER = "kyawmgmgthu";
    private static final String JDBC_PASS = "kyawmgmgthu789";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
            String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); 
            stmt.setString(3, email);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.html");
            } else {
                response.sendRedirect("register.html?error=Registration failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.html?error=Database error");
        }
    }
}

