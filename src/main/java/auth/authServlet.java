package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.svws_nrw.ext.jbcrypt.BCrypt;

@WebServlet("/authServlet")
public class authServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public authServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        String signUpQuery = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        String signInQuery = "SELECT name, password FROM users WHERE email = ?"; 

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            if (username == null || username.trim().isEmpty()) { 
                // Sign In
                PreparedStatement pstmt = conn.prepareStatement(signInQuery);
                pstmt.setString(1, email);
                ResultSet resultSet = pstmt.executeQuery();

                if (resultSet.next()) {
                    String storedUsername = resultSet.getString("name"); 
                    String storedHashedPassword = resultSet.getString("password");
                    boolean passwordMatch = BCrypt.checkpw(password, storedHashedPassword);

                    if (passwordMatch) {
                        session.setAttribute("username", storedUsername); 
                        session.setAttribute("email", email);
                        response.sendRedirect("Admin/index.jsp"); 
                    } else {
                        out.println("Invalid email or password.");
                    }
                } else {
                    out.println("Invalid email or password.");
                }
                resultSet.close();
                pstmt.close();
            } else {
                // Sign Up
                PreparedStatement pstmt = conn.prepareStatement(signUpQuery);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, hashedPassword);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    session.setAttribute("name", username);
                    session.setAttribute("email", email);
                    response.sendRedirect("Admin/login.jsp"); 
                } else {
                    out.println("Failed to sign up.");
                }
                pstmt.close();
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
