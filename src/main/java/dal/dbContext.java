package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class dbContext {
    public Connection con;

    public dbContext() {
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	String connectionUrl = "jdbc:mysql://localhost:3306/databaseName=Trading2022;encrypt=true;trustServerCertificate=true;user=root;password=778002";
            con = DriverManager.getConnection(connectionUrl);
            System.out.println("Kết nối thành công đến cơ sở dữ liệu.");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Lỗi khi kết nối đến cơ sở dữ liệu:");
            System.out.println(e);
        }
    }
}