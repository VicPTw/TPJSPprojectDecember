package pass;


public class Check {
    DBProxy DB;
	
	public Check(){
		DB = new DBProxy();
	}
	public String getPassword(){
		return DB.query("Admin", "user_pass", "user_id='admin001'");
    
        }
}