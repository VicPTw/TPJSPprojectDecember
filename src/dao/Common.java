package dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author VicP
 */
public abstract class Common {
    public static Connection getConnection() throws NamingException, SQLException {
        Connection con = null;
/*        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=TPJSP", "sa", "tvdi");
        } catch (Exception e) {
            System.out.println(e);
        }*/
        String datasourceName = "pooledDS";
    	DataSource datasource = null;
        InitialContext ic = new InitialContext();
		datasource = (javax.sql.DataSource) ic.lookup("java:comp/env/jdbc/" + datasourceName);
		con = datasource.getConnection();
        return con;
    }
}
