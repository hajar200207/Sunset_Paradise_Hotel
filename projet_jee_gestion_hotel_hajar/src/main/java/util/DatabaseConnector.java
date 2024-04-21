package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/hotel_management";
        String user = "";
        String password = "";
        
        return DriverManager.getConnection(url, user, password);
    }
}

