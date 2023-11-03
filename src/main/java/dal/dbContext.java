package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class dbContext {
    public Connection con;

    public dbContext() {
        
        try {
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=Trading2022;encrypt=true;trustServerCertificate=true;user=sa;password=123";
            con = DriverManager.getConnection(connectionUrl);
            System.out.println("Kết nối thành công đến cơ sở dữ liệu.");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Lỗi khi kết nối đến cơ sở dữ liệu:");
            System.out.println(e);
        }
    }
}