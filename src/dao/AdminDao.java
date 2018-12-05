package dao;

/**
 *
 * @author Vic
 */
import java.sql.*;

import bean.Admin;

public class AdminDao {

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

	// not going to use this.
	/*public static int save(Admin a) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
			"insert into Admin(user_id,user_pass) values(?,?)");
			ps.setString(1, a.getUserId());
			ps.setString(2, a.getUserPass());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	*/
	
	public static Admin getRecordById(String id){  
	    Admin a = null;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Admin where user_id=?");  
	        ps.setString(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            a =new Admin();  
	            a.setUserId(rs.getString("user_id"));  
	            a.setUserPass(rs.getString("user_pass"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return a;  
	}  
	
}