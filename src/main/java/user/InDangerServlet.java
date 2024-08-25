package user;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/InDangerServlet")
public class InDangerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read JSON data from the request body
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
        }
        String requestBody = stringBuilder.toString();
        
        // Parse JSON data
        String phone = "";
        int caseId = 0;
        double latitude = 0;
        double longitude = 0;
        try {
            JsonObject jsonObject = JsonParser.parseString(requestBody).getAsJsonObject();
            phone = jsonObject.get("phone").getAsString();
            caseId = jsonObject.get("case").getAsInt();
            latitude = jsonObject.get("latitude").getAsDouble();
            longitude = jsonObject.get("longitude").getAsDouble();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid input\"}");
            return;
        }

        // Prepare SQL statement
        String url = "jdbc:mariadb://localhost:3306/ODS_System";
        String user = "kyawmgmgthu";
        String password = "kyawmgmgthu789"; // Replace with your DB password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String sql = "INSERT INTO In_Danger (ph_number, case_id, map, status) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phone);
            pstmt.setInt(2, caseId);
            pstmt.setString(3, latitude + ", " + longitude);
            pstmt.setString(4, "Pending"); // Example status
            pstmt.executeUpdate();

            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
