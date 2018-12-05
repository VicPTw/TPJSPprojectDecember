package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author VicP
 */
public abstract class Common {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=TPJSP", "sa", "tvdi");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
