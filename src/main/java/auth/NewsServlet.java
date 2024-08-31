package auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/NewsServlet")
@MultipartConfig
public class NewsServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "news_image";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set character encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part imagePart = request.getPart("photo");

        if (title == null || content == null || imagePart == null || imagePart.getSize() == 0) {
            response.sendRedirect("admin.jsp?status=error&message=All fields are required.");
            return;
        }

        String fileName = imagePart.getSubmittedFileName();
        String imagePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(imagePath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        
        try {
            imagePart.write(imagePath + File.separator + fileName);
        } catch (IOException e) {
            response.sendRedirect("/Disaster_Safety/Admin/admin.jsp?status=error&message=Failed to save image. " + e.getMessage());
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System?useUnicode=true&characterEncoding=utf8mb4", "kyawmgmgthu", "kyawmgmgthu789");
            String query = "INSERT INTO news (title, content, photo_path) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, fileName);

            int result = pstmt.executeUpdate();
            PrintWriter out = response.getWriter();
            if (result > 0) {
                out.println("<script>alert('News added successfully!');window.location.href='/Disaster_Safety/Admin/news.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to add news.');window.location.href='/Disaster_Safety/Admin/news.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('An error occurred.');window.location.href='/Disaster_Safety/Admin/news.jsp';</script>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
