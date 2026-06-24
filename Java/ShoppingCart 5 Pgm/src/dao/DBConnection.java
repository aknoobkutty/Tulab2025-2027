package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    private static final Logger LOGGER = Logger.getLogger(DBConnection.class.getName());
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shopping",
                "root",
                "12345"
            );

            LOGGER.info("DB connected successfully");
            return con;

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.log(Level.SEVERE, "DB connection failed", e);
            return null;
        }
    }
}