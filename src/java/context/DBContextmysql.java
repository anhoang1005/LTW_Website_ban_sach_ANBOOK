
package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContextmysql {
    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }

    private final String serverName = "localhost";
    private final String dbName = "anstore";
    private final String portNumber = "3306"; // MySQL default port
    private final String userID = "root"; // Your MySQL username
    private final String password = "10052002"; // Your MySQL password
    
    public static void main(String[] args) {
        try {
            System.out.println(new DBContextmysql().getConnection());
            System.out.println("Kết nối thành công!");            
        } catch (Exception e) {
            System.out.println("Kết nối thất bại!");
            e.printStackTrace();
        }
    }
}
