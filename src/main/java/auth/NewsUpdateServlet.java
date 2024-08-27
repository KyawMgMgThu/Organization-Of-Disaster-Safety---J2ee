package auth;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/NewsUpdateServlet")
public class NewsUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form parameters
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            out.println("<p>Error: Missing or invalid news ID.</p>");
            return;
        }

        int id = 0;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid news ID format.</p>");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part photoPart = request.getPart("photo");
        String photoPath = "";

        // File upload logic
        if (photoPart != null && photoPart.getSize() > 0) {
            String fileName = photoPart.getSubmittedFileName();
            photoPath = "news_images/" + fileName;

            // Save the uploaded file
            String fullSavePath = getServletContext().getRealPath("/") + photoPath;
            photoPart.write(fullSavePath);
        } else {
            // If no new photo is uploaded, keep the existing photo
            photoPath = request.getParameter("existingPhotoPath");
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Database connection
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            // Update the news item in the database
            String updateQuery = "UPDATE news SET title = ?, content = ?, photo_path = ? WHERE id = ?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, photoPath);
            stmt.setInt(4, id);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                out.println("<p>News item updated successfully.</p>");
                response.sendRedirect("news.jsp");
            } else {
                out.println("<p>Error: Failed to update news item.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}