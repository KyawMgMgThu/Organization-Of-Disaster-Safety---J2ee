package auth;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import de.svws_nrw.ext.jbcrypt.BCrypt;

@WebServlet("/authServlet")
public class authServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public authServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        String signUpQuery = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        String signInQuery = "SELECT name, password FROM users WHERE email = ?";
        String checkEmailQuery = "SELECT email FROM users WHERE email = ?";

        JsonObject jsonResponse = new JsonObject();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        ResultSet emailResultSet = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            if (username == null || username.trim().isEmpty()) { 
                // Sign In
                pstmt = conn.prepareStatement(signInQuery);
                pstmt.setString(1, email);
                resultSet = pstmt.executeQuery();

                if (resultSet.next()) {
                    String storedUsername = resultSet.getString("name"); 
                    String storedHashedPassword = resultSet.getString("password");
                    boolean passwordMatch = BCrypt.checkpw(password, storedHashedPassword);

                    if (passwordMatch) {
                        session.setAttribute("username", storedUsername); 
                        session.setAttribute("email", email);
                        jsonResponse.addProperty("status", "success");
                        jsonResponse.addProperty("redirect", "index.jsp");
                    } else {
                        jsonResponse.addProperty("status", "error");
                        jsonResponse.addProperty("message", "Invalid email or password.");
                    }
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Invalid email or password.");
                }
            } else {
                pstmt = conn.prepareStatement(checkEmailQuery);
                pstmt.setString(1, email);
                emailResultSet = pstmt.executeQuery();

                if (emailResultSet.next()) {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Email already exists. Please use a different email.");
                } else {
                    // Sign Up
                    pstmt = conn.prepareStatement(signUpQuery);
                    pstmt.setString(1, username);
                    pstmt.setString(2, email);
                    pstmt.setString(3, hashedPassword);

                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        session.setAttribute("name", username);
                        session.setAttribute("email", email);
                        jsonResponse.addProperty("status", "success");
                        jsonResponse.addProperty("redirect", "login.jsp");
                    } else {
                        jsonResponse.addProperty("status", "error");
                        jsonResponse.addProperty("message", "Failed to sign up.");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (emailResultSet != null) emailResultSet.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        out.print(jsonResponse.toString());
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
