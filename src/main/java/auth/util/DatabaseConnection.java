package auth.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        String dbURL = "jdbc:mariadb://localhost:3306/ODS_System";
        String username = "kyawmgmgthu";
        String password = "kyawmgmgthu789";
        
        return DriverManager.getConnection(dbURL, username, password);
    }
}
