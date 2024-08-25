package auth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import auth.model.InDanger;

@WebServlet("/Indanger")
public class Indanger extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<InDanger> inDangerList = new ArrayList<>();

        try {
            // Load the MariaDB driver
            Class.forName("org.mariadb.jdbc.Driver");
            // Establish the connection
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ODS_System", "kyawmgmgthu", "kyawmgmgthu789");

            String sql = "SELECT id, ph_number, case_id, map FROM In_Danger";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                InDanger inDanger = new InDanger();
                inDanger.setId(rs.getInt("id"));
                inDanger.setPhoneNumber(rs.getString("ph_number"));
                inDanger.setCaseType(rs.getInt("case_id"));
                inDanger.setLocation(rs.getString("map"));
                inDangerList.add(inDanger);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Store the data in the session
        HttpSession session = request.getSession();
        session.setAttribute("inDangerList", inDangerList);

        // Redirect to JSP page
        response.sendRedirect("Admin/indanger.jsp");
    }
}
